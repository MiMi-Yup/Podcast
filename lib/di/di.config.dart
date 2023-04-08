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
import 'package:join_podcast/data/auth/auth_repository_impl.dart' as _i5;
import 'package:join_podcast/data/data_source/local/secure_preferences_service.dart'
    as _i7;
import 'package:join_podcast/data/data_source/remote/api_service.dart' as _i3;
import 'package:join_podcast/data/data_source/remote/auth_service.dart' as _i6;
import 'package:join_podcast/data/preferences_repository_impl.dart' as _i11;
import 'package:join_podcast/data/unit_of_work_impl.dart' as _i13;
import 'package:join_podcast/data/user/user_repository_impl.dart' as _i9;
import 'package:join_podcast/di/module/network_module.dart' as _i18;
import 'package:join_podcast/domain/repositories/auth_repository.dart' as _i4;
import 'package:join_podcast/domain/repositories/preferences_repository.dart'
    as _i10;
import 'package:join_podcast/domain/repositories/unit_of_work.dart' as _i12;
import 'package:join_podcast/domain/repositories/user_repository.dart' as _i8;
import 'package:join_podcast/domain/use_cases/login_page_usecases.dart' as _i15;
import 'package:join_podcast/domain/use_cases/welcome_page_usecases.dart'
    as _i14;
import 'package:join_podcast/presentation/auth/login/cubit/login_cubit.dart'
    as _i17;
import 'package:join_podcast/presentation/welcome_page/cubit/welcome_cubit.dart'
    as _i16;

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
    gh.factory<_i4.AuthRepository>(
        () => _i5.AuthRepositoryImpl(authService: gh<_i6.AuthService>()));
    gh.factory<_i6.AuthService>(() => networkModule.authService);
    gh.singleton<_i7.SecurePreferencesService>(_i7.SecurePreferencesService());
    gh.factory<_i8.UserRepository>(
        () => _i9.UserRepositoryImpl(api: gh<_i3.ApiService>()));
    gh.factory<_i10.PreferencesRepository>(() => _i11.PreferencesRepositoryImpl(
        storage: gh<_i7.SecurePreferencesService>()));
    gh.factory<_i12.UnitOfWork>(() => _i13.UnitOfWorkImpl(
          userRepo: gh<_i8.UserRepository>(),
          preferencesRepo: gh<_i10.PreferencesRepository>(),
          authRepo: gh<_i4.AuthRepository>(),
        ));
    gh.factory<_i14.WelcomeUseCases>(
        () => _i14.WelcomeUseCases(unitOfWork: gh<_i12.UnitOfWork>()));
    gh.factory<_i15.LoginUseCases>(
        () => _i15.LoginUseCases(unitOfWork: gh<_i12.UnitOfWork>()));
    gh.factory<_i16.WelcomeCubit>(
        () => _i16.WelcomeCubit(welcomeUserCases: gh<_i14.WelcomeUseCases>()));
    gh.factory<_i17.LoginCubit>(
        () => _i17.LoginCubit(loginUserCases: gh<_i15.LoginUseCases>()));
    return this;
  }
}

class _$NetworkModule extends _i18.NetworkModule {}
