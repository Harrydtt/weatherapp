part of 'location_bloc.dart';

class LocationState extends Equatable {
  final LocationData locationData;

  const LocationState({
    required this.locationData,
  });

  @override
  List<Object> get props => [locationData];
}

class LocationInitialState extends LocationState {
  const LocationInitialState({required LocationData locationData})
      : super(locationData: locationData);
}

class LocationLoadingState extends LocationState {
  const LocationLoadingState({required LocationData locationData})
      : super(locationData: locationData);
}

class LocationLoadSuccessState extends LocationState {
  // final LocationData locationData;

  const LocationLoadSuccessState({
    required locationData,
  }) : super(locationData: locationData);
}
