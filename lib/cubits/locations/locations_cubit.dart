import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mentz_project/data/models/location.dart';
import 'package:mentz_project/data/respositories/locations_repository.dart';

part 'locations_state.dart';

class LocationsCubit extends Cubit<LocationsState> {
  LocationsCubit(this._locationsRepository) : super(const LocationsInitial());

  final LocationsRepository _locationsRepository;

  Future<void> getLocations(String location) async {
    try {
      emit(const LocationsLoading());
      List<Location> locations =
          await _locationsRepository.getStopsForLocation(location);
      if (locations.isEmpty) {
        emit(const LocationsEmpty());
      } else {
        emit(LocationsSuccess(locations: locations));
      }
    } catch (e) {
      if (e is SocketException) {
        emit(const LocationsNetworkError());
      } else {
        emit(LocationsError(message: e.toString()));
      }
    }
  }

  void resetLocations() {
    emit(const LocationsSuccess(locations: []));
  }
}
