// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:where_my_team/data/data_source/local/gps_service.dart' as _i6;
import 'package:where_my_team/data/data_source/remote/api_service.dart' as _i3;
import 'package:where_my_team/data/gps/gps_repository_impl.dart' as _i5;
import 'package:where_my_team/data/location/location_repository_impl.dart'
    as _i9;
import 'package:where_my_team/di/module/network_module.dart' as _i11;
import 'package:where_my_team/domain/repositories/gps_repository.dart' as _i4;
import 'package:where_my_team/domain/repositories/location_repository.dart'
    as _i8;
import 'package:where_my_team/domain/use_cases/home_page_usecases.dart' as _i7;
import 'package:where_my_team/presentation/home_page/cubit/home_page_cubit.dart'
    as _i10;

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
    gh.factory<_i3.ApiService>(() => networkModule.apiService);
    gh.factory<_i4.GPSRepository>(
        () => _i5.GPSRepositoryImpl(gps: gh<_i6.GPSService>()));
    gh.singleton<_i6.GPSService>(_i6.GPSService());
    gh.factory<_i7.HomepageUseCases>(
        () => _i7.HomepageUseCases(gpsRepo: gh<_i4.GPSRepository>()));
    gh.factory<_i8.LocationRepository>(
        () => _i9.LocationRepositoryImpl(api: gh<_i3.ApiService>()));
    gh.factory<_i10.HomePageCubit>(
        () => _i10.HomePageCubit(homepageUseCases: gh<_i7.HomepageUseCases>()));
    return this;
  }
}

class _$NetworkModule extends _i11.NetworkModule {}
