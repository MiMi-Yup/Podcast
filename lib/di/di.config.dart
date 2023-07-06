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
    as _i10;
import 'package:join_podcast/data/data_source/local/secure_preferences_service.dart'
    as _i20;
import 'package:join_podcast/data/data_source/local/shared_preferences_service.dart'
    as _i21;
import 'package:join_podcast/data/data_source/remote/auth_service.dart' as _i5;
import 'package:join_podcast/data/data_source/remote/category_service.dart'
    as _i6;
import 'package:join_podcast/data/data_source/remote/episode_service.dart'
    as _i9;
import 'package:join_podcast/data/data_source/remote/media_service.dart'
    as _i13;
import 'package:join_podcast/data/data_source/remote/playlist_service.dart'
    as _i16;
import 'package:join_podcast/data/data_source/remote/podcasts_service.dart'
    as _i19;
import 'package:join_podcast/data/data_source/remote/user_service.dart' as _i22;
import 'package:join_podcast/data/episode/episode_repository_impl.dart' as _i8;
import 'package:join_podcast/data/media/media_repository_impl.dart' as _i12;
import 'package:join_podcast/data/playlist/playlist_repository_impl.dart'
    as _i15;
import 'package:join_podcast/data/podcast/podcast_repository_impl.dart' as _i18;
import 'package:join_podcast/data/secure_preferences_repository_impl.dart'
    as _i24;
import 'package:join_podcast/data/session_info.dart' as _i25;
import 'package:join_podcast/data/shared_preferences_repository_impl.dart'
    as _i27;
import 'package:join_podcast/data/unit_of_work_impl.dart' as _i31;
import 'package:join_podcast/data/user/user_repository_impl.dart' as _i29;
import 'package:join_podcast/di/module/network_module.dart' as _i66;
import 'package:join_podcast/domain/repositories/auth_repository.dart' as _i3;
import 'package:join_podcast/domain/repositories/episode_repository.dart'
    as _i7;
import 'package:join_podcast/domain/repositories/media_repository.dart' as _i11;
import 'package:join_podcast/domain/repositories/playlist_repository.dart'
    as _i14;
import 'package:join_podcast/domain/repositories/podcast_repository.dart'
    as _i17;
import 'package:join_podcast/domain/repositories/secure_preferences_repository.dart'
    as _i23;
import 'package:join_podcast/domain/repositories/shared_preferences_repository.dart'
    as _i26;
import 'package:join_podcast/domain/repositories/unit_of_work.dart' as _i30;
import 'package:join_podcast/domain/repositories/user_repository.dart' as _i28;
import 'package:join_podcast/domain/use_cases/episode_page_usecase.dart'
    as _i47;
import 'package:join_podcast/domain/use_cases/login_page_usecases.dart' as _i50;
import 'package:join_podcast/domain/use_cases/playlist_usecases.dart' as _i52;
import 'package:join_podcast/domain/use_cases/user_usecases.dart' as _i32;
import 'package:join_podcast/models/playlist_model.dart' as _i65;
import 'package:join_podcast/presentation/auth/login/cubit/login_cubit.dart'
    as _i63;
import 'package:join_podcast/presentation/auth/reset/cubit/reset_cubit.dart'
    as _i55;
import 'package:join_podcast/presentation/author/cubit/author_cubit.dart'
    as _i37;
import 'package:join_podcast/presentation/bottom_bar/cubit/bottom_bar_cubit.dart'
    as _i39;
import 'package:join_podcast/presentation/channel/new_channel/create_name_and_description/cubit/createNameAndDescription_cubit.dart'
    as _i40;
import 'package:join_podcast/presentation/channel/new_channel/create_new_channel/cubit/create_new_channel_cubit.dart'
    as _i41;
import 'package:join_podcast/presentation/channel/new_episode/cubit/createNewEpisode_cubit.dart'
    as _i42;
import 'package:join_podcast/presentation/channel/new_podcast/createNewPodcast/cubit/createNewPodcast_cubit.dart'
    as _i43;
import 'package:join_podcast/presentation/channel/new_podcast/editPodcast/cubit/editPodcast_cubit.dart'
    as _i46;
import 'package:join_podcast/presentation/download/cubit/download_cubit.dart'
    as _i45;
import 'package:join_podcast/presentation/edit_info_podcast/add_avatar/cubit/add_avatar_cubit.dart'
    as _i34;
import 'package:join_podcast/presentation/edit_info_podcast/add_text_avatar/cubit/add_text_avatar_cubit.dart'
    as _i36;
import 'package:join_podcast/presentation/edit_info_podcast/discover_podcast/cubit/discover_podcast_cubit.dart'
    as _i44;
import 'package:join_podcast/presentation/edit_info_podcast/podcast_availability/cubit/podcast_availability_cubit.dart'
    as _i53;
import 'package:join_podcast/presentation/edit_info_podcast/set_info_podcast/cubit/set_info_podcast_cubit.dart'
    as _i57;
import 'package:join_podcast/presentation/episode/cubit/episode_cubit.dart'
    as _i59;
import 'package:join_podcast/presentation/home/home_tab/cubit/home_cubit.dart'
    as _i48;
import 'package:join_podcast/presentation/home/search/cubit/search_cubit.dart'
    as _i56;
import 'package:join_podcast/presentation/library/cubit/library_cubit.dart'
    as _i62;
import 'package:join_podcast/presentation/new_user/add_info/cubit/add_info_cubit.dart'
    as _i35;
import 'package:join_podcast/presentation/new_user/init_subscribe/cubit/init_subscribe_cubit.dart'
    as _i60;
import 'package:join_podcast/presentation/new_user/interest/cubit/interest_cubit.dart'
    as _i61;
import 'package:join_podcast/presentation/notification/cubit/notification_cubit.dart'
    as _i51;
import 'package:join_podcast/presentation/playlist/cubit/playlist_cubit.dart'
    as _i64;
import 'package:join_podcast/presentation/record/background_music/background_music_home/cubit/background_music_home_cubit.dart'
    as _i38;
import 'package:join_podcast/presentation/record/list_record/cubit/list_record_cubit.dart'
    as _i49;
import 'package:join_podcast/presentation/record/record_page/cubit/record_page_cubit.dart'
    as _i54;
import 'package:join_podcast/presentation/subscription/cubit/subscription_cubit.dart'
    as _i58;
import 'package:join_podcast/presentation/welcome_page/cubit/welcome_cubit.dart'
    as _i33;

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
    gh.factory<_i7.EpisodeRepository>(
        () => _i8.EpisodeRepositoryImpl(service: gh<_i9.EpisodeService>()));
    gh.factory<_i9.EpisodeService>(() => networkModule.episodeService);
    gh.lazySingleton<_i10.LocalStorageService>(
        () => _i10.LocalStorageService());
    gh.factory<_i11.MediaRepository>(
        () => _i12.MediaRepositoryImpl(service: gh<_i13.MediaService>()));
    gh.factory<_i13.MediaService>(() => networkModule.mediaService);
    gh.factory<_i14.PlaylistRepository>(
        () => _i15.PlaylistRepositoryImpl(service: gh<_i16.PlaylistService>()));
    gh.factory<_i16.PlaylistService>(() => networkModule.playlistService);
    gh.factory<_i17.PodcastRepository>(
        () => _i18.PodcastRepositoryImpl(service: gh<_i19.PodcastsService>()));
    gh.factory<_i19.PodcastsService>(() => networkModule.podcastsService);
    gh.singleton<_i20.SecurePreferencesService>(
        _i20.SecurePreferencesService());
    gh.singleton<_i21.SharedPreferencesService>(
        _i21.SharedPreferencesService());
    gh.factory<_i22.UserService>(() => networkModule.userService);
    gh.factory<_i23.SecurePreferencesRepository>(() =>
        _i24.SecurePreferencesRepositoryImpl(
            storage: gh<_i20.SecurePreferencesService>()));
    gh.singleton<_i25.SessionInfo>(
        _i25.SessionInfo(secureRepo: gh<_i23.SecurePreferencesRepository>()));
    gh.factory<_i26.SharedPreferencesRepository>(() =>
        _i27.SharedPreferencesRepositoryImpl(
            storage: gh<_i21.SharedPreferencesService>()));
    gh.factory<_i28.UserRepository>(
        () => _i29.UserRepositoryImpl(userService: gh<_i22.UserService>()));
    gh.factory<_i30.UnitOfWork>(() => _i31.UnitOfWorkImpl(
          auth: gh<_i3.AuthRepository>(),
          session: gh<_i25.SessionInfo>(),
          sharedPreferences: gh<_i26.SharedPreferencesRepository>(),
          user: gh<_i28.UserRepository>(),
          media: gh<_i11.MediaRepository>(),
          playlist: gh<_i14.PlaylistRepository>(),
          episode: gh<_i7.EpisodeRepository>(),
          podcast: gh<_i17.PodcastRepository>(),
        ));
    gh.factory<_i32.UserUseCases>(
        () => _i32.UserUseCases(unitOfWork: gh<_i30.UnitOfWork>()));
    gh.factory<_i33.WelcomeCubit>(
        () => _i33.WelcomeCubit(usecase: gh<_i32.UserUseCases>()));
    gh.factory<_i34.AddAvatarCubit>(
        () => _i34.AddAvatarCubit(unitOfWork: gh<_i30.UnitOfWork>()));
    gh.factory<_i35.AddInfoCubit>(() => _i35.AddInfoCubit(
          usecase: gh<_i32.UserUseCases>(),
          signUp: gh<bool>(),
        ));
    gh.factory<_i36.AddTextAvatarCubit>(
        () => _i36.AddTextAvatarCubit(unitOfWork: gh<_i30.UnitOfWork>()));
    gh.factory<_i37.AuthorCubit>(
        () => _i37.AuthorCubit(unitOfWork: gh<_i30.UnitOfWork>()));
    gh.factory<_i38.BackgroundMusicHomeCubit>(
        () => _i38.BackgroundMusicHomeCubit(unitOfWork: gh<_i30.UnitOfWork>()));
    gh.factory<_i39.BottomBarCubit>(
        () => _i39.BottomBarCubit(unitOfWork: gh<_i30.UnitOfWork>()));
    gh.factory<_i40.CreateNameAndDescriptionCubit>(() =>
        _i40.CreateNameAndDescriptionCubit(unitOfWork: gh<_i30.UnitOfWork>()));
    gh.factory<_i41.CreateNewChannelCubit>(
        () => _i41.CreateNewChannelCubit(usecase: gh<_i32.UserUseCases>()));
    gh.factory<_i42.CreateNewEpisodeCubit>(
        () => _i42.CreateNewEpisodeCubit(unitOfWork: gh<_i30.UnitOfWork>()));
    gh.factory<_i43.CreateNewPodcastCubit>(
        () => _i43.CreateNewPodcastCubit(unitOfWork: gh<_i30.UnitOfWork>()));
    gh.factory<_i44.DiscoverPodcastCubit>(
        () => _i44.DiscoverPodcastCubit(unitOfWork: gh<_i30.UnitOfWork>()));
    gh.factory<_i45.DownloadCubit>(() => _i45.DownloadCubit(
          unitOfWork: gh<_i30.UnitOfWork>(),
          service: gh<_i10.LocalStorageService>(),
        ));
    gh.factory<_i46.EditPodcastCubit>(
        () => _i46.EditPodcastCubit(unitOfWork: gh<_i30.UnitOfWork>()));
    gh.factory<_i47.EpisodeUseCases>(
        () => _i47.EpisodeUseCases(unitOfWork: gh<_i30.UnitOfWork>()));
    gh.factory<_i48.HomeCubit>(
        () => _i48.HomeCubit(unitOfWork: gh<_i30.UnitOfWork>()));
    gh.factory<_i49.ListRecordCubit>(
        () => _i49.ListRecordCubit(unitOfWork: gh<_i30.UnitOfWork>()));
    gh.factory<_i50.LoginUseCases>(
        () => _i50.LoginUseCases(unitOfWork: gh<_i30.UnitOfWork>()));
    gh.factory<_i51.NotificationCubit>(
        () => _i51.NotificationCubit(unitOfWork: gh<_i30.UnitOfWork>()));
    gh.factory<_i52.PlaylistUseCases>(
        () => _i52.PlaylistUseCases(unitOfWork: gh<_i30.UnitOfWork>()));
    gh.factory<_i53.PodcastAvailabilityCubit>(
        () => _i53.PodcastAvailabilityCubit(unitOfWork: gh<_i30.UnitOfWork>()));
    gh.factory<_i54.RecordPageCubit>(
        () => _i54.RecordPageCubit(unitOfWork: gh<_i30.UnitOfWork>()));
    gh.factory<_i55.ResetAccountCubit>(() => _i55.ResetAccountCubit(
          usecase: gh<_i50.LoginUseCases>(),
          token: gh<String>(),
        ));
    gh.factory<_i56.SearchCubit>(
        () => _i56.SearchCubit(unitOfWork: gh<_i30.UnitOfWork>()));
    gh.factory<_i57.SetInfoPodcastCubit>(
        () => _i57.SetInfoPodcastCubit(unitOfWork: gh<_i30.UnitOfWork>()));
    gh.factory<_i58.SubscriptionCubit>(
        () => _i58.SubscriptionCubit(unitOfWork: gh<_i30.UnitOfWork>()));
    gh.factory<_i59.EpisodeCubit>(() => _i59.EpisodeCubit(
          id: gh<String>(),
          episodeUseCases: gh<_i47.EpisodeUseCases>(),
        ));
    gh.factory<_i60.InitSubscribeCubit>(
        () => _i60.InitSubscribeCubit(usecase: gh<_i50.LoginUseCases>()));
    gh.factory<_i61.InterestCubit>(
        () => _i61.InterestCubit(usecase: gh<_i50.LoginUseCases>()));
    gh.factory<_i62.LibraryCubit>(
        () => _i62.LibraryCubit(usecase: gh<_i52.PlaylistUseCases>()));
    gh.factory<_i63.LoginCubit>(
        () => _i63.LoginCubit(usecase: gh<_i50.LoginUseCases>()));
    gh.factory<_i64.PlaylistCubit>(() => _i64.PlaylistCubit(
          usecase: gh<_i52.PlaylistUseCases>(),
          playlist: gh<_i65.PlaylistModel>(),
        ));
    return this;
  }
}

class _$NetworkModule extends _i66.NetworkModule {}
