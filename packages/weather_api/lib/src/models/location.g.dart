// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Location',
      json,
      ($checkedConvert) {
        final val = Location(
          name: $checkedConvert('name', (v) => v as String),
          lat: $checkedConvert('lat', (v) => (v as num).toDouble()),
          lon: $checkedConvert('lon', (v) => (v as num).toDouble()),
          country: $checkedConvert('country', (v) => v as String),
          state: $checkedConvert('state', (v) => v as String),
        );
        return val;
      },
    );
