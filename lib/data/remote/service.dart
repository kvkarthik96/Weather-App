import 'package:weather_app/data/model/weather_model.dart';
import 'package:weather_app/data/remote/network.dart';

import 'cities_static_data.dart';

class Service {
  Network network = Network();

  String baseUrl = 'https://weatherapi-com.p.rapidapi.com/current.json?q=';

  Map<String, String> headers = {
    'X-RapidAPI-Key': 'ec12c0205cmsh4f88acb77c99562p1ee541jsn3acd3ba00356',
    'X-RapidAPI-Host': 'weatherapi-com.p.rapidapi.com'
  };

  // Weather Details API call
  Future<WeatherModel> getWeatherDetails(String cityName) async {
    return network
        .get('$baseUrl$cityName', headers: headers)
        .then((dynamic res) {
      return WeatherModel.fromMap(res);
    });
  }

  // Fetching static cities list
  Future<List<String>> getCitiesList() async {
    return Future.delayed(const Duration(milliseconds: 500)).then((value) {
      return citiesList;
    });
  }
}
