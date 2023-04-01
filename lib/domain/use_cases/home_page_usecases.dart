import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:where_my_team/domain/repositories/gps_repository.dart';
import 'package:where_my_team/domain/repositories/location_repository.dart';
import 'package:where_my_team/models/location_model.dart';
import 'package:where_my_team/models/request/get_location_request.dart';

// @injectable
// class HomepageUseCases {
//   final LocationRepository locationRepo;

//   HomepageUseCases({required this.locationRepo});

//   FutureOr<LocationModel?> getSetting(String? param) async {
//     if(param == null) {
//       throw NullThrownError();
//     }
//     final response = await locationRepo.getLocation(GetLocationRequest(param));
//     return response?.data;
//   }
// }

@injectable
class HomepageUseCases {
  final GPSRepository gpsRepo;

  HomepageUseCases({required this.gpsRepo});

  FutureOr<LocationData?> getCurrentLocation() async {
    LocationData? data = await gpsRepo.getCurrentLocation();
    return data;
  }

  Future<Stream<LocationData>?> getStreamLocation() async {
    Stream<LocationData>? data = await gpsRepo.getStream();
    return data;
  }

  Future checkPermission() async {
    gpsRepo.checkPermission();
  }
}
