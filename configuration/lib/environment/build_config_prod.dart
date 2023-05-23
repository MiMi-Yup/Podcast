import 'package:configuration/environment/build_config.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BuildConfig, env: [CustomEnv.prod])
class BuildConfigProd extends BuildConfig {
  @override
  String get host => 'https://podcast-server-a50v.onrender.com';

  @override
  String get hostSocketIO => 'wss://...';
}
