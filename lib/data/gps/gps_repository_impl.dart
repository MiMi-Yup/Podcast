import 'dart:async';
import 'package:injectable/injectable.dart';
import 'package:location_platform_interface/location_platform_interface.dart';
import 'package:where_my_team/data/data_source/local/gps_service.dart';
import 'package:where_my_team/data/data_source/remote/api_service.dart';
import 'package:where_my_team/domain/repositories/gps_repository.dart';
import 'package:where_my_team/domain/repositories/location_repository.dart';
import 'package:where_my_team/models/location_model.dart';
import 'package:where_my_team/models/request/get_location_request.dart';
import 'package:where_my_team/models/response/get_location_response.dart';

@Injectable(as: GPSRepository)
class GPSRepositoryImpl implements GPSRepository {
  final GPSService? gps;
  bool _allowPermission = false;
  GPSRepositoryImpl({required this.gps});

  FutureOr<bool?> checkPermission() async {
    bool? permission = await gps?.checkPermission();
    _allowPermission = permission ?? false;
    return permission;
  }

  @override
  FutureOr<LocationData?> getCurrentLocation() {
    if (_allowPermission) {
      return gps?.getLocation;
    }
    return null;
  }

  @override
  FutureOr<Stream<LocationData>?> getStream() {
    if (_allowPermission) {
      return gps?.getStream;
    }
    return null;
  }
}
