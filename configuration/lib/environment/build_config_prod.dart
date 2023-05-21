import 'package:configuration/environment/build_config.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BuildConfig, env: [CustomEnv.prod])
class BuildConfigProd extends BuildConfig {
  @override
  String get host => 'http://10.0.2.2:8080/';

  @override
  String get hostSocketIO => 'wss://...';
}
