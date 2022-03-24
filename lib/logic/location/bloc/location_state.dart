part of 'location_bloc.dart';

class LocationState extends Equatable {
  final LocationData locationData;

  LocationState({
    required this.locationData,
  });

  @override
  List<Object> get props => [locationData];
}

class LocationInitialState extends LocationState {
  LocationInitialState({required LocationData locationData})
      : super(locationData: locationData);
}

class LocationLoadingState extends LocationState {
  LocationLoadingState({required LocationData locationData})
      : super(locationData: locationData);
}

class LocationLoadSuccessState extends LocationState {
  final LocationData locationData;

  LocationLoadSuccessState({
    required this.locationData,
  }) : super(locationData: locationData);
}
