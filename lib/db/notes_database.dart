import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tempo_clima/models/city.dart';

class NotesDatabase {
  static final NotesDatabase instance = NotesDatabase._init();

  static Database _database;

  NotesDatabase._init();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDB('savedCustomCities.db');
    return _database;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    final textType = 'TEXT NOT NULL';

    await db.execute('''
CREATE TABLE savedCities ( 
  ${CityFields.customName} $textType, 
  ${CityFields.name} $textType
  )
''');
  }

  Future<City> create(City city) async {
    final db = await instance.database;

    final customName = await db.insert("savedCities", city.toJson());
    return city.copy(customName: customName.toString());
  }

  Future<City> readNote(String customName) async {
    final db = await instance.database;

    final maps = await db.query(
      "savedCities",
      where: '${CityFields.customName} = ?',
      whereArgs: [customName],
    );

    if (maps.isNotEmpty) {
      return City.deJson(maps.first);
    } else {
      throw Exception('CustomName $customName not found');
    }
  }

  Future<List<City>> readAllNotes() async {
    final db = await instance.database;

    final result = await db.query("savedCities");

    return result.map((json) => City.deJson(json)).toList();
  }

  Future<int> update(City city) async {
    final db = await instance.database;

    return db.update(
      "savedCities",
      city.toJson(),
      where: '${CityFields.customName} = ?',
      whereArgs: [city.customName],
    );
  }

  Future<int> delete(String customName) async {
    final db = await instance.database;

    return await db.delete(
      "savedCities",
      where: '${CityFields.customName} = ?',
      whereArgs: [customName],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}