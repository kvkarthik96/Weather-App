import 'dart:convert';

import 'package:http/http.dart' as http;

class Network {
  /* Json Decoder */
  final JsonDecoder _decoder = const JsonDecoder();

  /* Get Http Call */
  Future<dynamic> get(String url,
      {required Map<String, String>? headers, isCountry = false}) async {
    return await http
        .get(Uri.parse(url), headers: headers)
        .then((http.Response response) async {
      final dynamic res = _decoder.convert(response.body);
      return res;
    });
  }
}
