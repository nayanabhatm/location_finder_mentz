part of 'locations_cubit.dart';

abstract class LocationsState extends Equatable {
  const LocationsState();

  @override
  List<Object> get props => [];
}

class LocationsInitial extends LocationsState {
  const LocationsInitial();
}

class LocationsLoading extends LocationsState {
  const LocationsLoading();
}

class LocationsSuccess extends LocationsState {
  final List<Location> locations;
  const LocationsSuccess({required this.locations});

  @override
  List<Object> get props => [locations];
}

class LocationsError extends LocationsState {
  const LocationsError(
      {this.message = 'Something went wrong!. Please try again'});
  final String message;
}

class LocationsNetworkError extends LocationsState {
  const LocationsNetworkError(
      {this.message = 'Please check your connectivity'});
  final String message;
}

class LocationsEmpty extends LocationsState {
  const LocationsEmpty();
}
