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
    as _i15;
import 'package:join_podcast/data/data_source/local/shared_preferences_service.dart'
    as _i16;
import 'package:join_podcast/data/data_source/remote/auth_service.dart' as _i5;
import 'package:join_podcast/data/data_source/remote/episode_service.dart'
    as _i8;
import 'package:join_podcast/data/data_source/remote/media_service.dart'
    as _i11;
import 'package:join_podcast/data/data_source/remote/podcasts_service.dart'
    as _i14;
import 'package:join_podcast/data/data_source/remote/user_service.dart' as _i19;
import 'package:join_podcast/data/episode/episode_repository_impl.dart' as _i7;
import 'package:join_podcast/data/media/media_repository_impl.dart' as _i10;
import 'package:join_podcast/data/podcast/podcast_repository_impl.dart' as _i13;
import 'package:join_podcast/data/secure_preferences_repository_impl.dart'
    as _i21;
import 'package:join_podcast/data/session_info.dart' as _i22;
import 'package:join_podcast/data/shared_preferences_repository_impl.dart'
    as _i24;
import 'package:join_podcast/data/unit_of_work_impl.dart' as _i26;
import 'package:join_podcast/data/user/user_repository_impl.dart' as _i18;
import 'package:join_podcast/di/module/network_module.dart' as _i48;
import 'package:join_podcast/domain/repositories/auth_repository.dart' as _i3;
import 'package:join_podcast/domain/repositories/episode_repository.dart'
    as _i6;
import 'package:join_podcast/domain/repositories/media_repository.dart' as _i9;
import 'package:join_podcast/domain/repositories/podcast_repository.dart'
    as _i12;
import 'package:join_podcast/domain/repositories/secure_preferences_repository.dart'
    as _i20;
import 'package:join_podcast/domain/repositories/shared_preferences_repository.dart'
    as _i23;
import 'package:join_podcast/domain/repositories/unit_of_work.dart' as _i25;
import 'package:join_podcast/domain/repositories/user_repository.dart' as _i17;
import 'package:join_podcast/domain/use_cases/login_page_usecases.dart' as _i37;
import 'package:join_podcast/domain/use_cases/user_usecases.dart' as _i27;
import 'package:join_podcast/presentation/auth/login/cubit/login_cubit.dart'
    as _i47;
import 'package:join_podcast/presentation/auth/reset/cubit/reset_cubit.dart'
    as _i42;
import 'package:join_podcast/presentation/author/cubit/author_cubit.dart'
    as _i30;
import 'package:join_podcast/presentation/bottom_bar/cubit/bottom_bar_cubit.dart'
    as _i32;
import 'package:join_podcast/presentation/download/cubit/download_cubit.dart'
    as _i33;
import 'package:join_podcast/presentation/home/home_tab/cubit/home_cubit.dart'
    as _i34;
import 'package:join_podcast/presentation/home/search/cubit/search_cubit.dart'
    as _i43;
import 'package:join_podcast/presentation/library/cubit/library_cubit.dart'
    as _i35;
import 'package:join_podcast/presentation/new_user/add_info/cubit/add_info_cubit.dart'
    as _i29;
import 'package:join_podcast/presentation/new_user/init_subscribe/cubit/init_subscribe_cubit.dart'
    as _i45;
import 'package:join_podcast/presentation/new_user/interest/cubit/interest_cubit.dart'
    as _i46;
import 'package:join_podcast/presentation/notification/cubit/notification_cubit.dart'
    as _i38;
import 'package:join_podcast/presentation/playlist/cubit/playlist_cubit.dart'
    as _i39;
import 'package:join_podcast/presentation/podcast/cubit/podcast_cubit.dart'
    as _i40;
import 'package:join_podcast/presentation/record/background_music/background_music_home/cubit/background_music_home_cubit.dart'
    as _i31;
import 'package:join_podcast/presentation/record/list_record/cubit/list_record_cubit.dart'
    as _i36;
import 'package:join_podcast/presentation/record/record_page/cubit/record_page_cubit.dart'
    as _i41;
import 'package:join_podcast/presentation/subscription/cubit/subscription_cubit.dart'
    as _i44;
import 'package:join_podcast/presentation/welcome_page/cubit/welcome_cubit.dart'
    as _i28;

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
    gh.factory<_i6.EpisodeRepository>(
        () => _i7.EpisodeRepositoryImpl(service: gh<_i8.EpisodeService>()));
    gh.factory<_i8.EpisodeService>(() => networkModule.episodeService);
    gh.factory<_i9.MediaRepository>(
        () => _i10.MediaRepositoryImpl(service: gh<_i11.MediaService>()));
    gh.factory<_i11.MediaService>(() => networkModule.mediaService);
    gh.factory<_i12.PodcastRepository>(
        () => _i13.PodcastRepositoryImpl(service: gh<_i14.PodcastsService>()));
    gh.factory<_i14.PodcastsService>(() => networkModule.podcastsService);
    gh.singleton<_i15.SecurePreferencesService>(
        _i15.SecurePreferencesService());
    gh.singleton<_i16.SharedPreferencesService>(
        _i16.SharedPreferencesService());
    gh.factory<_i17.UserRepository>(
        () => _i18.UserRepositoryImpl(userService: gh<_i19.UserService>()));
    gh.factory<_i19.UserService>(() => networkModule.userService);
    gh.factory<_i20.SecurePreferencesRepository>(() =>
        _i21.SecurePreferencesRepositoryImpl(
            storage: gh<_i15.SecurePreferencesService>()));
    gh.singleton<_i22.SessionInfo>(
        _i22.SessionInfo(secureRepo: gh<_i20.SecurePreferencesRepository>()));
    gh.factory<_i23.SharedPreferencesRepository>(() =>
        _i24.SharedPreferencesRepositoryImpl(
            storage: gh<_i16.SharedPreferencesService>()));
    gh.factory<_i25.UnitOfWork>(() => _i26.UnitOfWorkImpl(
          auth: gh<_i3.AuthRepository>(),
          session: gh<_i22.SessionInfo>(),
          sharedPreferences: gh<_i23.SharedPreferencesRepository>(),
          user: gh<_i17.UserRepository>(),
        ));
    gh.factory<_i27.UserUseCases>(
        () => _i27.UserUseCases(unitOfWork: gh<_i25.UnitOfWork>()));
    gh.factory<_i28.WelcomeCubit>(
        () => _i28.WelcomeCubit(welcomeUserCases: gh<_i27.UserUseCases>()));
    gh.factory<_i29.AddInfoCubit>(
        () => _i29.AddInfoCubit(userUserCases: gh<_i27.UserUseCases>()));
    gh.factory<_i30.AuthorCubit>(
        () => _i30.AuthorCubit(unitOfWork: gh<_i25.UnitOfWork>()));
    gh.factory<_i31.BackgroundMusicHomeCubit>(
        () => _i31.BackgroundMusicHomeCubit(unitOfWork: gh<_i25.UnitOfWork>()));
    gh.factory<_i32.BottomBarCubit>(
        () => _i32.BottomBarCubit(unitOfWork: gh<_i25.UnitOfWork>()));
    gh.factory<_i33.DownloadCubit>(
        () => _i33.DownloadCubit(unitOfWork: gh<_i25.UnitOfWork>()));
    gh.factory<_i34.HomeCubit>(
        () => _i34.HomeCubit(unitOfWork: gh<_i25.UnitOfWork>()));
    gh.factory<_i35.LibraryCubit>(
        () => _i35.LibraryCubit(unitOfWork: gh<_i25.UnitOfWork>()));
    gh.factory<_i36.ListRecordCubit>(
        () => _i36.ListRecordCubit(unitOfWork: gh<_i25.UnitOfWork>()));
    gh.factory<_i37.LoginUseCases>(
        () => _i37.LoginUseCases(unitOfWork: gh<_i25.UnitOfWork>()));
    gh.factory<_i38.NotificationCubit>(
        () => _i38.NotificationCubit(unitOfWork: gh<_i25.UnitOfWork>()));
    gh.factory<_i39.PlaylistCubit>(
        () => _i39.PlaylistCubit(unitOfWork: gh<_i25.UnitOfWork>()));
    gh.factory<_i40.PodcastCubit>(
        () => _i40.PodcastCubit(unitOfWork: gh<_i25.UnitOfWork>()));
    gh.factory<_i41.RecordPageCubit>(
        () => _i41.RecordPageCubit(unitOfWork: gh<_i25.UnitOfWork>()));
    gh.factory<_i42.ResetAccountCubit>(() => _i42.ResetAccountCubit(
          loginUserCases: gh<_i37.LoginUseCases>(),
          token: gh<String>(),
        ));
    gh.factory<_i43.SearchCubit>(
        () => _i43.SearchCubit(unitOfWork: gh<_i25.UnitOfWork>()));
    gh.factory<_i44.SubscriptionCubit>(
        () => _i44.SubscriptionCubit(unitOfWork: gh<_i25.UnitOfWork>()));
    gh.factory<_i45.InitSubscribeCubit>(() =>
        _i45.InitSubscribeCubit(loginUserCases: gh<_i37.LoginUseCases>()));
    gh.factory<_i46.InterestCubit>(
        () => _i46.InterestCubit(loginUserCases: gh<_i37.LoginUseCases>()));
    gh.factory<_i47.LoginCubit>(
        () => _i47.LoginCubit(loginUserCases: gh<_i37.LoginUseCases>()));
    return this;
  }
}

class _$NetworkModule extends _i48.NetworkModule {}
