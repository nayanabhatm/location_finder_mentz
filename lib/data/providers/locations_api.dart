import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:mentz_project/utils/location_exception.dart';

class LocationsApi {
  static const String _baseUrl = 'mvvvip1.defas-fgi.de';

  Future<Map<String, dynamic>> getLocations(String searchText) async {
    try {
      Map<String, String> queryParams = {
        'language': 'de',
        'outputFormat': 'RapidJSON',
        'type_sf': 'any',
        'charset': 'utf-8',
        'name_sf': searchText
      };
      http.Response response = await http.get(
        Uri.https(_baseUrl, '/mvv/XML_STOPFINDER_REQUEST', queryParams),
      );

      if (response.statusCode != 200) {
        throw LocationException('Something went wrong!. Please try again');
      }

      return json.decode(utf8.decode(response.bodyBytes));
    } on SocketException {
      throw const SocketException('Please check your connectivity');
    } catch (e) {
      throw LocationException(e.toString());
    }
  }
}
