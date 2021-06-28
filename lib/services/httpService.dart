import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class HttpService {
  String baseUrl = "https://api.openweathermap.org/data/2.5";
  var _http;
  String _appId="c754de9b022aca92fdce88d71cfc8a60";
  HttpClient get getHttp => _http;

  HttpService() {
    _http = new http.Client();
  }

  Future<http.Response> fetchData(String name) async {
    return http.get(Uri.parse('$baseUrl/weather?appid=$_appId&q=$name&units=metric'));
  }
}