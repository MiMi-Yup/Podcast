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
import 'package:join_podcast/data/auth/auth_repository_impl.dart' as _i4;
import 'package:join_podcast/data/data_source/local/secure_preferences_service.dart'
    as _i6;
import 'package:join_podcast/data/data_source/local/shared_preferences_service.dart'
    as _i7;
import 'package:join_podcast/data/data_source/remote/auth_service.dart' as _i5;
import 'package:join_podcast/data/data_source/remote/user_service.dart' as _i10;
import 'package:join_podcast/data/secure_preferences_repository_impl.dart'
    as _i12;
import 'package:join_podcast/data/shared_preferences_repository_impl.dart'
    as _i14;
import 'package:join_podcast/data/unit_of_work_impl.dart' as _i16;
import 'package:join_podcast/data/user/user_repository_impl.dart' as _i9;
import 'package:join_podcast/di/module/network_module.dart' as _i36;
import 'package:join_podcast/domain/repositories/auth_repository.dart' as _i3;
import 'package:join_podcast/domain/repositories/secure_preferences_repository.dart'
    as _i11;
import 'package:join_podcast/domain/repositories/shared_preferences_repository.dart'
    as _i13;
import 'package:join_podcast/domain/repositories/unit_of_work.dart' as _i15;
import 'package:join_podcast/domain/repositories/user_repository.dart' as _i8;
import 'package:join_podcast/domain/use_cases/login_page_usecases.dart' as _i27;
import 'package:join_podcast/domain/use_cases/user_usecases.dart' as _i17;
import 'package:join_podcast/presentation/auth/login/cubit/login_cubit.dart'
    as _i35;
import 'package:join_podcast/presentation/auth/reset/cubit/reset_cubit.dart'
    as _i31;
import 'package:join_podcast/presentation/author/cubit/author_cubit.dart'
    as _i20;
import 'package:join_podcast/presentation/bottom_bar/cubit/bottom_bar_cubit.dart'
    as _i22;
import 'package:join_podcast/presentation/download/cubit/download_cubit.dart'
    as _i23;
import 'package:join_podcast/presentation/home/cubit/home_cubit.dart' as _i24;
import 'package:join_podcast/presentation/library/cubit/library_cubit.dart'
    as _i25;
import 'package:join_podcast/presentation/new_user/add_info/cubit/add_info_cubit.dart'
    as _i19;
import 'package:join_podcast/presentation/new_user/init_subscribe/cubit/init_subscribe_cubit.dart'
    as _i33;
import 'package:join_podcast/presentation/new_user/interest/cubit/interest_cubit.dart'
    as _i34;
import 'package:join_podcast/presentation/notification/cubit/notification_cubit.dart'
    as _i28;
import 'package:join_podcast/presentation/podcast/cubit/podcast_cubit.dart'
    as _i29;
import 'package:join_podcast/presentation/record/background_music/background_music_home/cubit/background_music_home_cubit.dart'
    as _i21;
import 'package:join_podcast/presentation/record/list_record/cubit/list_record_cubit.dart'
    as _i26;
import 'package:join_podcast/presentation/record/record_page/cubit/record_page_cubit.dart'
    as _i30;
import 'package:join_podcast/presentation/subscription/cubit/subscription_cubit.dart'
    as _i32;
import 'package:join_podcast/presentation/welcome_page/cubit/welcome_cubit.dart'
    as _i18;

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
    gh.factory<_i3.AuthRepository>(
        () => _i4.AuthRepositoryImpl(authService: gh<_i5.AuthService>()));
    gh.factory<_i5.AuthService>(() => networkModule.authService);
    gh.singleton<_i6.SecurePreferencesService>(_i6.SecurePreferencesService());
    gh.singleton<_i7.SharedPreferencesService>(_i7.SharedPreferencesService());
    gh.factory<_i8.UserRepository>(
        () => _i9.UserRepositoryImpl(userService: gh<_i10.UserService>()));
    gh.factory<_i10.UserService>(() => networkModule.userService);
    gh.factory<_i11.SecurePreferencesRepository>(() =>
        _i12.SecurePreferencesRepositoryImpl(
            storage: gh<_i6.SecurePreferencesService>()));
    gh.singleton<_i12.SessionAuthenticaiton>(_i12.SessionAuthenticaiton(
        secureRepo: gh<_i11.SecurePreferencesRepository>()));
    gh.factory<_i13.SharedPreferencesRepository>(() =>
        _i14.SharedPreferencesRepositoryImpl(
            storage: gh<_i7.SharedPreferencesService>()));
    gh.factory<_i15.UnitOfWork>(() => _i16.UnitOfWorkImpl(
          auth: gh<_i3.AuthRepository>(),
          secure: gh<_i12.SessionAuthenticaiton>(),
          sharedPreferences: gh<_i13.SharedPreferencesRepository>(),
          user: gh<_i8.UserRepository>(),
        ));
    gh.factory<_i17.UserUseCases>(
        () => _i17.UserUseCases(unitOfWork: gh<_i15.UnitOfWork>()));
    gh.factory<_i18.WelcomeCubit>(
        () => _i18.WelcomeCubit(welcomeUserCases: gh<_i17.UserUseCases>()));
    gh.factory<_i19.AddInfoCubit>(
        () => _i19.AddInfoCubit(userUserCases: gh<_i17.UserUseCases>()));
    gh.factory<_i20.AuthorCubit>(
        () => _i20.AuthorCubit(unitOfWork: gh<_i15.UnitOfWork>()));
    gh.factory<_i21.BackgroundMusicHomeCubit>(
        () => _i21.BackgroundMusicHomeCubit(unitOfWork: gh<_i15.UnitOfWork>()));
    gh.factory<_i22.BottomBarCubit>(
        () => _i22.BottomBarCubit(unitOfWork: gh<_i15.UnitOfWork>()));
    gh.factory<_i23.DownloadCubit>(
        () => _i23.DownloadCubit(unitOfWork: gh<_i15.UnitOfWork>()));
    gh.factory<_i24.HomeCubit>(
        () => _i24.HomeCubit(unitOfWork: gh<_i15.UnitOfWork>()));
    gh.factory<_i25.LibraryCubit>(
        () => _i25.LibraryCubit(unitOfWork: gh<_i15.UnitOfWork>()));
    gh.factory<_i26.ListRecordCubit>(
        () => _i26.ListRecordCubit(unitOfWork: gh<_i15.UnitOfWork>()));
    gh.factory<_i27.LoginUseCases>(
        () => _i27.LoginUseCases(unitOfWork: gh<_i15.UnitOfWork>()));
    gh.factory<_i28.NotificationCubit>(
        () => _i28.NotificationCubit(unitOfWork: gh<_i15.UnitOfWork>()));
    gh.factory<_i29.PodcastCubit>(
        () => _i29.PodcastCubit(unitOfWork: gh<_i15.UnitOfWork>()));
    gh.factory<_i30.RecordPageCubit>(
        () => _i30.RecordPageCubit(unitOfWork: gh<_i15.UnitOfWork>()));
    gh.factory<_i31.ResetAccountCubit>(() => _i31.ResetAccountCubit(
          loginUserCases: gh<_i27.LoginUseCases>(),
          token: gh<String>(),
        ));
    gh.factory<_i32.SubscriptionCubit>(
        () => _i32.SubscriptionCubit(unitOfWork: gh<_i15.UnitOfWork>()));
    gh.factory<_i33.InitSubscribeCubit>(() =>
        _i33.InitSubscribeCubit(loginUserCases: gh<_i27.LoginUseCases>()));
    gh.factory<_i34.InterestCubit>(
        () => _i34.InterestCubit(loginUserCases: gh<_i27.LoginUseCases>()));
    gh.factory<_i35.LoginCubit>(
        () => _i35.LoginCubit(loginUserCases: gh<_i27.LoginUseCases>()));
    return this;
  }
}

class _$NetworkModule extends _i36.NetworkModule {}
