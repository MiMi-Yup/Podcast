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
    as _i11;
import 'package:join_podcast/data/data_source/local/secure_preferences_service.dart'
    as _i21;
import 'package:join_podcast/data/data_source/local/shared_preferences_service.dart'
    as _i22;
import 'package:join_podcast/data/data_source/remote/auth_service.dart' as _i5;
import 'package:join_podcast/data/data_source/remote/category_service.dart'
    as _i6;
import 'package:join_podcast/data/data_source/remote/episode_service.dart'
    as _i10;
import 'package:join_podcast/data/data_source/remote/media_service.dart'
    as _i14;
import 'package:join_podcast/data/data_source/remote/playlist_service.dart'
    as _i17;
import 'package:join_podcast/data/data_source/remote/podcasts_service.dart'
    as _i20;
import 'package:join_podcast/data/data_source/remote/user_service.dart' as _i23;
import 'package:join_podcast/data/data_source/runtime/player_storage_service.dart'
    as _i7;
import 'package:join_podcast/data/episode/episode_repository_impl.dart' as _i9;
import 'package:join_podcast/data/media/media_repository_impl.dart' as _i13;
import 'package:join_podcast/data/playlist/playlist_repository_impl.dart'
    as _i16;
import 'package:join_podcast/data/podcast/podcast_repository_impl.dart' as _i19;
import 'package:join_podcast/data/secure_preferences_repository_impl.dart'
    as _i25;
import 'package:join_podcast/data/session_info.dart' as _i26;
import 'package:join_podcast/data/shared_preferences_repository_impl.dart'
    as _i28;
import 'package:join_podcast/data/unit_of_work_impl.dart' as _i32;
import 'package:join_podcast/data/user/user_repository_impl.dart' as _i30;
import 'package:join_podcast/di/module/network_module.dart' as _i65;
import 'package:join_podcast/domain/repositories/auth_repository.dart' as _i3;
import 'package:join_podcast/domain/repositories/episode_repository.dart'
    as _i8;
import 'package:join_podcast/domain/repositories/media_repository.dart' as _i12;
import 'package:join_podcast/domain/repositories/playlist_repository.dart'
    as _i15;
import 'package:join_podcast/domain/repositories/podcast_repository.dart'
    as _i18;
import 'package:join_podcast/domain/repositories/secure_preferences_repository.dart'
    as _i24;
import 'package:join_podcast/domain/repositories/shared_preferences_repository.dart'
    as _i27;
import 'package:join_podcast/domain/repositories/unit_of_work.dart' as _i31;
import 'package:join_podcast/domain/repositories/user_repository.dart' as _i29;
import 'package:join_podcast/domain/use_cases/episode_page_usecase.dart'
    as _i46;
import 'package:join_podcast/domain/use_cases/login_page_usecases.dart' as _i49;
import 'package:join_podcast/domain/use_cases/playlist_usecases.dart' as _i52;
import 'package:join_podcast/domain/use_cases/user_usecases.dart' as _i33;
import 'package:join_podcast/presentation/auth/login/cubit/login_cubit.dart'
    as _i63;
import 'package:join_podcast/presentation/auth/reset/cubit/reset_cubit.dart'
    as _i56;
import 'package:join_podcast/presentation/bottom_bar/cubit/bottom_bar_cubit.dart'
    as _i39;
import 'package:join_podcast/presentation/channel/new_channel/create_name_and_description/cubit/createNameAndDescription_cubit.dart'
    as _i40;
import 'package:join_podcast/presentation/channel/new_episode/cubit/createNewEpisode_cubit.dart'
    as _i41;
import 'package:join_podcast/presentation/channel/new_podcast/createNewPodcast/cubit/createNewPodcast_cubit.dart'
    as _i42;
import 'package:join_podcast/presentation/channel/new_podcast/editPodcast/cubit/editPodcast_cubit.dart'
    as _i45;
import 'package:join_podcast/presentation/download/cubit/download_cubit.dart'
    as _i44;
import 'package:join_podcast/presentation/edit_info_podcast/add_avatar/cubit/add_avatar_cubit.dart'
    as _i35;
import 'package:join_podcast/presentation/edit_info_podcast/add_text_avatar/cubit/add_text_avatar_cubit.dart'
    as _i37;
import 'package:join_podcast/presentation/edit_info_podcast/discover_podcast/cubit/discover_podcast_cubit.dart'
    as _i43;
import 'package:join_podcast/presentation/edit_info_podcast/podcast_availability/cubit/podcast_availability_cubit.dart'
    as _i53;
import 'package:join_podcast/presentation/edit_info_podcast/set_info_podcast/cubit/set_info_podcast_cubit.dart'
    as _i58;
import 'package:join_podcast/presentation/home/home_tab/cubit/home_cubit.dart'
    as _i47;
import 'package:join_podcast/presentation/home/search/cubit/search_cubit.dart'
    as _i57;
import 'package:join_podcast/presentation/library/cubit/library_cubit.dart'
    as _i62;
import 'package:join_podcast/presentation/new_user/add_info/cubit/add_info_cubit.dart'
    as _i36;
import 'package:join_podcast/presentation/new_user/init_subscribe/cubit/init_subscribe_cubit.dart'
    as _i60;
import 'package:join_podcast/presentation/new_user/interest/cubit/interest_cubit.dart'
    as _i61;
import 'package:join_podcast/presentation/notification/cubit/notification_cubit.dart'
    as _i50;
import 'package:join_podcast/presentation/player/cubit/player_cubit.dart'
    as _i51;
import 'package:join_podcast/presentation/playlist/cubit/playlist_cubit.dart'
    as _i64;
import 'package:join_podcast/presentation/podcast/cubit/podcast_cubit.dart'
    as _i54;
import 'package:join_podcast/presentation/record/background_music/background_music_home/cubit/background_music_home_cubit.dart'
    as _i38;
import 'package:join_podcast/presentation/record/list_record/cubit/list_record_cubit.dart'
    as _i48;
import 'package:join_podcast/presentation/record/record_page/cubit/record_page_cubit.dart'
    as _i55;
import 'package:join_podcast/presentation/subscription/cubit/subscription_cubit.dart'
    as _i59;
import 'package:join_podcast/presentation/welcome_page/cubit/welcome_cubit.dart'
    as _i34;

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
    gh.factory<_i6.CategoryService>(() => networkModule.categoryService);
    gh.singleton<_i7.EpisodePlayerManager>(_i7.EpisodePlayerManager());
    gh.factory<_i8.EpisodeRepository>(
        () => _i9.EpisodeRepositoryImpl(service: gh<_i10.EpisodeService>()));
    gh.factory<_i10.EpisodeService>(() => networkModule.episodeService);
    gh.lazySingleton<_i11.LocalStorageService>(
        () => _i11.LocalStorageService());
    gh.factory<_i12.MediaRepository>(
        () => _i13.MediaRepositoryImpl(service: gh<_i14.MediaService>()));
    gh.factory<_i14.MediaService>(() => networkModule.mediaService);
    gh.factory<_i15.PlaylistRepository>(
        () => _i16.PlaylistRepositoryImpl(service: gh<_i17.PlaylistService>()));
    gh.factory<_i17.PlaylistService>(() => networkModule.playlistService);
    gh.factory<_i18.PodcastRepository>(
        () => _i19.PodcastRepositoryImpl(service: gh<_i20.PodcastsService>()));
    gh.factory<_i20.PodcastsService>(() => networkModule.podcastsService);
    gh.singleton<_i21.SecurePreferencesService>(
        _i21.SecurePreferencesService());
    gh.singleton<_i22.SharedPreferencesService>(
        _i22.SharedPreferencesService());
    gh.factory<_i23.UserService>(() => networkModule.userService);
    gh.factory<_i24.SecurePreferencesRepository>(() =>
        _i25.SecurePreferencesRepositoryImpl(
            storage: gh<_i21.SecurePreferencesService>()));
    gh.singleton<_i26.SessionInfo>(
        _i26.SessionInfo(secureRepo: gh<_i24.SecurePreferencesRepository>()));
    gh.factory<_i27.SharedPreferencesRepository>(() =>
        _i28.SharedPreferencesRepositoryImpl(
            storage: gh<_i22.SharedPreferencesService>()));
    gh.factory<_i29.UserRepository>(
        () => _i30.UserRepositoryImpl(userService: gh<_i23.UserService>()));
    gh.factory<_i31.UnitOfWork>(() => _i32.UnitOfWorkImpl(
          auth: gh<_i3.AuthRepository>(),
          session: gh<_i26.SessionInfo>(),
          sharedPreferences: gh<_i27.SharedPreferencesRepository>(),
          user: gh<_i29.UserRepository>(),
          media: gh<_i12.MediaRepository>(),
          playlist: gh<_i15.PlaylistRepository>(),
          episode: gh<_i8.EpisodeRepository>(),
          podcast: gh<_i18.PodcastRepository>(),
        ));
    gh.factory<_i33.UserUseCases>(
        () => _i33.UserUseCases(unitOfWork: gh<_i31.UnitOfWork>()));
    gh.factory<_i34.WelcomeCubit>(
        () => _i34.WelcomeCubit(usecase: gh<_i33.UserUseCases>()));
    gh.factory<_i35.AddAvatarCubit>(
        () => _i35.AddAvatarCubit(unitOfWork: gh<_i31.UnitOfWork>()));
    gh.factory<_i36.AddInfoCubit>(() => _i36.AddInfoCubit(
          usecase: gh<_i33.UserUseCases>(),
          signUp: gh<bool>(),
        ));
    gh.factory<_i37.AddTextAvatarCubit>(
        () => _i37.AddTextAvatarCubit(unitOfWork: gh<_i31.UnitOfWork>()));
    gh.factory<_i38.BackgroundMusicHomeCubit>(
        () => _i38.BackgroundMusicHomeCubit(unitOfWork: gh<_i31.UnitOfWork>()));
    gh.factory<_i39.BottomBarCubit>(
        () => _i39.BottomBarCubit(unitOfWork: gh<_i31.UnitOfWork>()));
    gh.factory<_i40.CreateNameAndDescriptionCubit>(() =>
        _i40.CreateNameAndDescriptionCubit(unitOfWork: gh<_i31.UnitOfWork>()));
    gh.factory<_i41.CreateNewEpisodeCubit>(
        () => _i41.CreateNewEpisodeCubit(unitOfWork: gh<_i31.UnitOfWork>()));
    gh.factory<_i42.CreateNewPodcastCubit>(
        () => _i42.CreateNewPodcastCubit(unitOfWork: gh<_i31.UnitOfWork>()));
    gh.factory<_i43.DiscoverPodcastCubit>(
        () => _i43.DiscoverPodcastCubit(unitOfWork: gh<_i31.UnitOfWork>()));
    gh.factory<_i44.DownloadCubit>(() => _i44.DownloadCubit(
          unitOfWork: gh<_i31.UnitOfWork>(),
          service: gh<_i11.LocalStorageService>(),
        ));
    gh.factory<_i45.EditPodcastCubit>(
        () => _i45.EditPodcastCubit(unitOfWork: gh<_i31.UnitOfWork>()));
    gh.factory<_i46.EpisodeUseCases>(
        () => _i46.EpisodeUseCases(unitOfWork: gh<_i31.UnitOfWork>()));
    gh.factory<_i47.HomeCubit>(
        () => _i47.HomeCubit(unitOfWork: gh<_i31.UnitOfWork>()));
    gh.factory<_i48.ListRecordCubit>(
        () => _i48.ListRecordCubit(unitOfWork: gh<_i31.UnitOfWork>()));
    gh.factory<_i49.LoginUseCases>(
        () => _i49.LoginUseCases(unitOfWork: gh<_i31.UnitOfWork>()));
    gh.factory<_i50.NotificationCubit>(
        () => _i50.NotificationCubit(unitOfWork: gh<_i31.UnitOfWork>()));
    gh.factory<_i51.PlayerCubit>(() => _i51.PlayerCubit(
          id: gh<String>(),
          episodeUseCases: gh<_i46.EpisodeUseCases>(),
          episodePlayerManager: gh<_i7.EpisodePlayerManager>(),
        ));
    gh.factory<_i52.PlaylistUseCases>(
        () => _i52.PlaylistUseCases(unitOfWork: gh<_i31.UnitOfWork>()));
    gh.factory<_i53.PodcastAvailabilityCubit>(
        () => _i53.PodcastAvailabilityCubit(unitOfWork: gh<_i31.UnitOfWork>()));
    gh.factory<_i54.PodcastCubit>(
        () => _i54.PodcastCubit(unitOfWork: gh<_i31.UnitOfWork>()));
    gh.factory<_i55.RecordPageCubit>(
        () => _i55.RecordPageCubit(unitOfWork: gh<_i31.UnitOfWork>()));
    gh.factory<_i56.ResetAccountCubit>(() => _i56.ResetAccountCubit(
          usecase: gh<_i49.LoginUseCases>(),
          token: gh<String>(),
        ));
    gh.factory<_i57.SearchCubit>(
        () => _i57.SearchCubit(unitOfWork: gh<_i31.UnitOfWork>()));
    gh.factory<_i58.SetInfoPodcastCubit>(
        () => _i58.SetInfoPodcastCubit(unitOfWork: gh<_i31.UnitOfWork>()));
    gh.factory<_i59.SubscriptionCubit>(
        () => _i59.SubscriptionCubit(unitOfWork: gh<_i31.UnitOfWork>()));
    gh.factory<_i60.InitSubscribeCubit>(
        () => _i60.InitSubscribeCubit(usecase: gh<_i49.LoginUseCases>()));
    gh.factory<_i61.InterestCubit>(
        () => _i61.InterestCubit(usecase: gh<_i49.LoginUseCases>()));
    gh.factory<_i62.LibraryCubit>(
        () => _i62.LibraryCubit(usecase: gh<_i52.PlaylistUseCases>()));
    gh.factory<_i63.LoginCubit>(
        () => _i63.LoginCubit(usecase: gh<_i49.LoginUseCases>()));
    gh.factory<_i64.PlaylistCubit>(() => _i64.PlaylistCubit(
          usecase: gh<_i52.PlaylistUseCases>(),
          playlist: gh<String>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i65.NetworkModule {}
