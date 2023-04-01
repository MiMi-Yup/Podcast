import 'dart:async';

import 'package:location/location.dart';

abstract class GPSRepository{
  FutureOr<LocationData?> getCurrentLocation();
  FutureOr<Stream<LocationData>?> getStream();
  FutureOr<bool?> checkPermission();
}