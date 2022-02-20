import 'dart:io';

import 'package:mentz_project/data/models/location.dart';
import 'package:mentz_project/data/providers/locations_api.dart';
import 'package:mentz_project/utils/location_exception.dart';

class LocationsRepository {
  final LocationsApi locationsFinderApi = LocationsApi();

  Future<List<Location>> getStopsForLocation(String location) async {
    try {
      Map<String, dynamic> locationDetails =
          await locationsFinderApi.getLocations(location);
      List<Location> locations = locationDetails['locations']
          .map<Location>((location) => Location.fromJson(location))
          .toList();
      return locations;
    } on SocketException {
      throw const SocketException('Please check your connectivity');
    } catch (e) {
      throw LocationException(e.toString());
    }
  }
}
