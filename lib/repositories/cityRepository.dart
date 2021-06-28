import 'package:tempo_clima/services/httpService.dart';

class CityRepository {
  CityRepository();

  Future fetchCityWeather(String name) async {
    var client = HttpService();
    var response = await client.fetchData(name);

    if (response.statusCode == 200) {
      print(response.body);
      return response.body;
    }
    return response;
  }
}