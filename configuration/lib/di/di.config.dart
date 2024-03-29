// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:configuration/di/module/network_module.dart' as _i9;
import 'package:configuration/di/module/socket_module.dart' as _i10;
import 'package:configuration/environment/build_config.dart' as _i3;
import 'package:configuration/environment/build_config_dev.dart' as _i4;
import 'package:configuration/environment/build_config_prod.dart' as _i5;
import 'package:configuration/network/core_socket.dart' as _i8;
import 'package:dio/dio.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:socket_io_client/socket_io_client.dart' as _i7;

const String _dev = 'dev';
const String _prod = 'prod';

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final networkModule = _$NetworkModule();
    final socketModule = _$SocketModule();
    gh.factory<_i3.BuildConfig>(
      () => _i4.BuildConfigDev(),
      registerFor: {_dev},
    );
    gh.factory<_i3.BuildConfig>(
      () => _i5.BuildConfigProd(),
      registerFor: {_prod},
    );
    gh.factory<_i6.Dio>(() => networkModule.dio);
    gh.singleton<_i7.Socket>(socketModule.socketIO);
    gh.singleton<_i8.CoreSocket>(_i8.CoreSocket(socketIO: gh<_i7.Socket>()));
    return this;
  }
}

class _$NetworkModule extends _i9.NetworkModule {}

class _$SocketModule extends _i10.SocketModule {}
