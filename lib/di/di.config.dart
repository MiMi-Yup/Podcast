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
import 'package:join_podcast/data/data_source/local/local_storage_service.dart'
    as _i9;
import 'package:join_podcast/data/data_source/local/secure_preferences_service.dart'
    as _i19;
import 'package:join_podcast/data/data_source/local/shared_preferences_service.dart'
    as _i20;
import 'package:join_podcast/data/data_source/remote/auth_service.dart' as _i5;
import 'package:join_podcast/data/data_source/remote/episode_service.dart'
    as _i8;
import 'package:join_podcast/data/data_source/remote/media_service.dart'
    as _i12;
import 'package:join_podcast/data/data_source/remote/playlist_service.dart'
    as _i15;
import 'package:join_podcast/data/data_source/remote/podcasts_service.dart'
    as _i18;
import 'package:join_podcast/data/data_source/remote/user_service.dart' as _i21;
import 'package:join_podcast/data/episode/episode_repository_impl.dart' as _i7;
import 'package:join_podcast/data/media/media_repository_impl.dart' as _i11;
import 'package:join_podcast/data/playlist/playlist_repository_impl.dart'
    as _i14;
import 'package:join_podcast/data/podcast/podcast_repository_impl.dart' as _i17;
import 'package:join_podcast/data/secure_preferences_repository_impl.dart'
    as _i23;
import 'package:join_podcast/data/session_info.dart' as _i24;
import 'package:join_podcast/data/shared_preferences_repository_impl.dart'
    as _i26;
import 'package:join_podcast/data/unit_of_work_impl.dart' as _i30;
import 'package:join_podcast/data/user/user_repository_impl.dart' as _i28;
import 'package:join_podcast/di/module/network_module.dart' as _i60;
import 'package:join_podcast/domain/repositories/auth_repository.dart' as _i3;
import 'package:join_podcast/domain/repositories/episode_repository.dart'
    as _i6;
import 'package:join_podcast/domain/repositories/media_repository.dart' as _i10;
import 'package:join_podcast/domain/repositories/playlist_repository.dart'
    as _i13;
import 'package:join_podcast/domain/repositories/podcast_repository.dart'
    as _i16;
import 'package:join_podcast/domain/repositories/secure_preferences_repository.dart'
    as _i22;
import 'package:join_podcast/domain/repositories/shared_preferences_repository.dart'
    as _i25;
import 'package:join_podcast/domain/repositories/unit_of_work.dart' as _i29;
import 'package:join_podcast/domain/repositories/user_repository.dart' as _i27;
import 'package:join_podcast/domain/use_cases/login_page_usecases.dart' as _i43;
import 'package:join_podcast/domain/use_cases/playlist_usecases.dart' as _i45;
import 'package:join_podcast/domain/use_cases/podcast_page_usecase.dart'
    as _i47;
import 'package:join_podcast/domain/use_cases/user_usecases.dart' as _i31;
import 'package:join_podcast/models/playlist_model.dart' as _i58;
import 'package:join_podcast/presentation/auth/login/cubit/login_cubit.dart'
    as _i56;
import 'package:join_podcast/presentation/auth/reset/cubit/reset_cubit.dart'
    as _i49;
import 'package:join_podcast/presentation/author/cubit/author_cubit.dart'
    as _i36;
import 'package:join_podcast/presentation/bottom_bar/cubit/bottom_bar_cubit.dart'
    as _i38;
import 'package:join_podcast/presentation/download/cubit/download_cubit.dart'
    as _i40;
import 'package:join_podcast/presentation/edit_info_podcast/add_avatar/cubit/add_avatar_cubit.dart'
    as _i33;
import 'package:join_podcast/presentation/edit_info_podcast/add_text_avatar/cubit/add_text_avatar_cubit.dart'
    as _i35;
import 'package:join_podcast/presentation/edit_info_podcast/discover_podcast/cubit/discover_podcast_cubit.dart'
    as _i39;
import 'package:join_podcast/presentation/edit_info_podcast/podcast_availability/cubit/podcast_availability_cubit.dart'
    as _i46;
import 'package:join_podcast/presentation/edit_info_podcast/set_info_podcast/cubit/set_info_podcast_cubit.dart'
    as _i51;
import 'package:join_podcast/presentation/home/home_tab/cubit/home_cubit.dart'
    as _i41;
import 'package:join_podcast/presentation/home/search/cubit/search_cubit.dart'
    as _i50;
import 'package:join_podcast/presentation/library/cubit/library_cubit.dart'
    as _i55;
import 'package:join_podcast/presentation/new_user/add_info/cubit/add_info_cubit.dart'
    as _i34;
import 'package:join_podcast/presentation/new_user/init_subscribe/cubit/init_subscribe_cubit.dart'
    as _i53;
import 'package:join_podcast/presentation/new_user/interest/cubit/interest_cubit.dart'
    as _i54;
import 'package:join_podcast/presentation/notification/cubit/notification_cubit.dart'
    as _i44;
import 'package:join_podcast/presentation/playlist/cubit/playlist_cubit.dart'
    as _i57;
import 'package:join_podcast/presentation/podcast/cubit/podcast_cubit.dart'
    as _i59;
import 'package:join_podcast/presentation/record/background_music/background_music_home/cubit/background_music_home_cubit.dart'
    as _i37;
import 'package:join_podcast/presentation/record/list_record/cubit/list_record_cubit.dart'
    as _i42;
import 'package:join_podcast/presentation/record/record_page/cubit/record_page_cubit.dart'
    as _i48;
import 'package:join_podcast/presentation/subscription/cubit/subscription_cubit.dart'
    as _i52;
import 'package:join_podcast/presentation/welcome_page/cubit/welcome_cubit.dart'
    as _i32;

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
    gh.lazySingleton<_i9.LocalStorageService>(() => _i9.LocalStorageService());
    gh.factory<_i10.MediaRepository>(
        () => _i11.MediaRepositoryImpl(service: gh<_i12.MediaService>()));
    gh.factory<_i12.MediaService>(() => networkModule.mediaService);
    gh.factory<_i13.PlaylistRepository>(
        () => _i14.PlaylistRepositoryImpl(service: gh<_i15.PlaylistService>()));
    gh.factory<_i15.PlaylistService>(() => networkModule.playlistService);
    gh.factory<_i16.PodcastRepository>(
        () => _i17.PodcastRepositoryImpl(service: gh<_i18.PodcastsService>()));
    gh.factory<_i18.PodcastsService>(() => networkModule.podcastsService);
    gh.singleton<_i19.SecurePreferencesService>(
        _i19.SecurePreferencesService());
    gh.singleton<_i20.SharedPreferencesService>(
        _i20.SharedPreferencesService());
    gh.factory<_i21.UserService>(() => networkModule.userService);
    gh.factory<_i22.SecurePreferencesRepository>(() =>
        _i23.SecurePreferencesRepositoryImpl(
            storage: gh<_i19.SecurePreferencesService>()));
    gh.singleton<_i24.SessionInfo>(
        _i24.SessionInfo(secureRepo: gh<_i22.SecurePreferencesRepository>()));
    gh.factory<_i25.SharedPreferencesRepository>(() =>
        _i26.SharedPreferencesRepositoryImpl(
            storage: gh<_i20.SharedPreferencesService>()));
    gh.factory<_i27.UserRepository>(
        () => _i28.UserRepositoryImpl(userService: gh<_i21.UserService>()));
    gh.factory<_i29.UnitOfWork>(() => _i30.UnitOfWorkImpl(
          auth: gh<_i3.AuthRepository>(),
          session: gh<_i24.SessionInfo>(),
          sharedPreferences: gh<_i25.SharedPreferencesRepository>(),
          user: gh<_i27.UserRepository>(),
          media: gh<_i10.MediaRepository>(),
          playlist: gh<_i13.PlaylistRepository>(),
          episode: gh<_i6.EpisodeRepository>(),
        ));
    gh.factory<_i31.UserUseCases>(
        () => _i31.UserUseCases(unitOfWork: gh<_i29.UnitOfWork>()));
    gh.factory<_i32.WelcomeCubit>(
        () => _i32.WelcomeCubit(usecase: gh<_i31.UserUseCases>()));
    gh.factory<_i33.AddAvatarCubit>(
        () => _i33.AddAvatarCubit(unitOfWork: gh<_i29.UnitOfWork>()));
    gh.factory<_i34.AddInfoCubit>(() => _i34.AddInfoCubit(
          usecase: gh<_i31.UserUseCases>(),
          signUp: gh<bool>(),
        ));
    gh.factory<_i35.AddTextAvatarCubit>(
        () => _i35.AddTextAvatarCubit(unitOfWork: gh<_i29.UnitOfWork>()));
    gh.factory<_i36.AuthorCubit>(
        () => _i36.AuthorCubit(unitOfWork: gh<_i29.UnitOfWork>()));
    gh.factory<_i37.BackgroundMusicHomeCubit>(
        () => _i37.BackgroundMusicHomeCubit(unitOfWork: gh<_i29.UnitOfWork>()));
    gh.factory<_i38.BottomBarCubit>(
        () => _i38.BottomBarCubit(unitOfWork: gh<_i29.UnitOfWork>()));
    gh.factory<_i39.DiscoverPodcastCubit>(
        () => _i39.DiscoverPodcastCubit(unitOfWork: gh<_i29.UnitOfWork>()));
    gh.factory<_i40.DownloadCubit>(() => _i40.DownloadCubit(
          unitOfWork: gh<_i29.UnitOfWork>(),
          service: gh<_i9.LocalStorageService>(),
        ));
    gh.factory<_i41.HomeCubit>(
        () => _i41.HomeCubit(unitOfWork: gh<_i29.UnitOfWork>()));
    gh.factory<_i42.ListRecordCubit>(
        () => _i42.ListRecordCubit(unitOfWork: gh<_i29.UnitOfWork>()));
    gh.factory<_i43.LoginUseCases>(
        () => _i43.LoginUseCases(unitOfWork: gh<_i29.UnitOfWork>()));
    gh.factory<_i44.NotificationCubit>(
        () => _i44.NotificationCubit(unitOfWork: gh<_i29.UnitOfWork>()));
    gh.factory<_i45.PlaylistUseCases>(
        () => _i45.PlaylistUseCases(unitOfWork: gh<_i29.UnitOfWork>()));
    gh.factory<_i46.PodcastAvailabilityCubit>(
        () => _i46.PodcastAvailabilityCubit(unitOfWork: gh<_i29.UnitOfWork>()));
    gh.factory<_i47.PodcastUseCases>(
        () => _i47.PodcastUseCases(unitOfWork: gh<_i29.UnitOfWork>()));
    gh.factory<_i48.RecordPageCubit>(
        () => _i48.RecordPageCubit(unitOfWork: gh<_i29.UnitOfWork>()));
    gh.factory<_i49.ResetAccountCubit>(() => _i49.ResetAccountCubit(
          usecase: gh<_i43.LoginUseCases>(),
          token: gh<String>(),
        ));
    gh.factory<_i50.SearchCubit>(
        () => _i50.SearchCubit(unitOfWork: gh<_i29.UnitOfWork>()));
    gh.factory<_i51.SetInfoPodcastCubit>(
        () => _i51.SetInfoPodcastCubit(unitOfWork: gh<_i29.UnitOfWork>()));
    gh.factory<_i52.SubscriptionCubit>(
        () => _i52.SubscriptionCubit(unitOfWork: gh<_i29.UnitOfWork>()));
    gh.factory<_i53.InitSubscribeCubit>(
        () => _i53.InitSubscribeCubit(usecase: gh<_i43.LoginUseCases>()));
    gh.factory<_i54.InterestCubit>(
        () => _i54.InterestCubit(usecase: gh<_i43.LoginUseCases>()));
    gh.factory<_i55.LibraryCubit>(
        () => _i55.LibraryCubit(usecase: gh<_i45.PlaylistUseCases>()));
    gh.factory<_i56.LoginCubit>(
        () => _i56.LoginCubit(usecase: gh<_i43.LoginUseCases>()));
    gh.factory<_i57.PlaylistCubit>(() => _i57.PlaylistCubit(
          usecase: gh<_i45.PlaylistUseCases>(),
          playlist: gh<_i58.PlaylistModel>(),
        ));
    gh.factory<_i59.PodcastCubit>(
        () => _i59.PodcastCubit(podcastUseCases: gh<_i47.PodcastUseCases>()));
    return this;
  }
}

class _$NetworkModule extends _i60.NetworkModule {}
