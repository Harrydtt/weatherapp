import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import '../../../data/repositories/send_alert_loc.dart';
import 'package:location/location.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  late bool _serviceEnabled;
  late Location location = Location();
  late PermissionStatus _permissionGranted;
  late LocationData locationData;

  late StreamSubscription<LocationData> locationStreamSubscription;

  LocationBloc(this.locationData)
      : super(LocationState(locationData: locationData));

  Stream<LocationState> mapEventToState(
    LocationEvent event,
  ) async* {
    if (event is LocationStartedEvent) {
      yield LocationLoadingState(locationData: locationData);
      _determinePosition();
    } else if (event is LocationChangedEvent) {
      yield LocationLoadSuccessState(
        locationData: event.locationData,
      );
    }
  }

  void dispose() {
    locationStreamSubscription.cancel();
  }

  void isLocationServiceEnabled() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }
  }

  void _checkForLocationPermission() async {
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  _determinePosition() async {
    // Cancel old subscription if any and
    // then start a new location subscription.
    locationStreamSubscription.cancel();

    // Test if location services are enabled.
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    isLocationServiceEnabled();

    // Permissions are denied, next time you could try
    // requesting permissions again (this is also where
    // Android's shouldShowRequestPermissionRationale
    // returned true. According to Android guidelines
    // your App should show an explanatory UI now.
    _checkForLocationPermission();

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    // i.e. if everything is fine call the LocationChangedEvent.

    locationStreamSubscription =
        location.onLocationChanged.listen((LocationData currentLocation) {
      add(
        LocationChangedEvent(locationData: currentLocation),
      );
    });
  }
}
