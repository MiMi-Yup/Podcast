import 'package:join_podcast/presentation/auth/login/login_route.dart';
import 'package:join_podcast/presentation/auth/reset/reset_route.dart';
import 'package:join_podcast/presentation/auth/verify/verify_create_route.dart';
import 'package:join_podcast/presentation/auth/verify/verify_forgot_route.dart';
import 'package:join_podcast/presentation/bottom_bar/bottom_bar_route.dart';
import 'package:join_podcast/presentation/channel/new_channel/create_new_channel/create_new_channel_route.dart';
import 'package:join_podcast/presentation/channel/new_episode/createNewEpisode_route.dart';
import 'package:join_podcast/presentation/channel/new_podcast/createNewPodcast/createNewPodcast_route.dart';
import 'package:join_podcast/presentation/channel/new_podcast/editPodcast/editPodcast_route.dart';
import 'package:join_podcast/presentation/detail_episode/detail_episode_route.dart';
import 'package:join_podcast/presentation/download/download_route.dart';
import 'package:join_podcast/presentation/edit_info_podcast/add_avatar/add_avatar_route.dart';
import 'package:join_podcast/presentation/edit_info_podcast/add_text_avatar/add_text_avatar_route.dart';
import 'package:join_podcast/presentation/edit_info_podcast/discover_podcast/discover_podcast_route.dart';
import 'package:join_podcast/presentation/edit_info_podcast/podcast_availability/podcast_availability_route.dart';
import 'package:join_podcast/presentation/edit_info_podcast/set_info_podcast/set_info_podcast_route.dart';
import 'package:join_podcast/presentation/history/history_route.dart';
import 'package:join_podcast/presentation/home/search/search_route.dart';
import 'package:join_podcast/presentation/introduction/introduction_route.dart';
import 'package:join_podcast/presentation/new_user/add_info/add_info_route.dart';
import 'package:join_podcast/presentation/new_user/init_subscribe/init_subscribe_route.dart';
import 'package:join_podcast/presentation/new_user/interest/interest_route.dart';
import 'package:join_podcast/presentation/player/player_route.dart';
import 'package:join_podcast/presentation/playlist/playlist_route.dart';
import 'package:join_podcast/presentation/podcast/podcast_route.dart';
import 'package:join_podcast/presentation/record/background_music/background_music_home/background_music_home_route.dart';
import 'package:join_podcast/presentation/record/list_record/list_record.dart';
import 'package:join_podcast/presentation/record/record_page/record_page_route.dart';
import 'package:join_podcast/presentation/subscription/subscription_route.dart';
import 'package:join_podcast/presentation/welcome_page/welcome_route.dart';
import 'package:join_podcast/presentation/record/background_music/background_music_details/background_music_detail_route.dart';

const routerIds = {
  WelcomeRoute: 'WelcomeRoute',
  LoginRoute: 'LoginRoute',
  IntroductionRoute: 'IntroductionRoute',
  AddInfoRoute: "AddInfoRoute",
  InterestRoute: "InterestRoute",
  BottomBarRoute: "BottomBarRoute",
  HistoryRoute: "HistoryRoute",
  SubscriptionRoute: "SubscriptionRoute",
  PodcastRoute: "PodcastRoute",
  BackgroundMusicHomeRoute: "BackgroundMusicHomeRoute",
  BackgroundMusicDetailRoute: "BackgroundMusicDetailRoute",
  RecordPageRoute: "RecordPageRoute",
  DetailEpisodeRoute: "EpisodeRoute",
  DownloadRoute: "DownloadRoute",
  ListRecordRoute: "ListRecordRoute",
  VerifyForgotRoute: "VerifyForgotRoute",
  VerifyCreateRoute: "VerifyCreateRoute",
  ResetAccountRoute: "ResetAccountRoute",
  InitSubscribeRoute: "InitSubscribeRoute",
  SearchRoute: "SearchRoute",
  PlaylistRoute: "PlaylistRoute",
  AddAvatarRoute: "AddAvatarRoute",
  DiscoverPodcastRoute: "DiscoverPodcastRoute",
  SetInfoPodcastRoute: "SetInfoPodcastRoute",
  AddTextAvatarRoute: "AddTextAvatarRoute",
  PodcastAvailabilityRoute: "PodcastAvailabilityRoute",
  EditPodcastRoute: "EditPodcastRoute",
  CreateNewPodcastRoute: "CreateNewPodcast",
  CreateNewEpisodeRoute: "CreateNewEpisode",
  CreateNewChannelRoute: "CreateNewChannel",
  PlayerRoute: "PlayerRouter",
};

void generateRoutes() {
  WelcomeRoute();
  LoginRoute();
  IntroductionRoute();
  AddInfoRoute();
  InterestRoute();
  BottomBarRoute();
  HistoryRoute();
  SubscriptionRoute();
  PodcastRoute();
  DetailEpisodeRoute();
  DownloadRoute();
  BackgroundMusicHomeRoute();
  BackgroundMusicDetailRoute();
  RecordPageRoute();
  ListRecordRoute();
  VerifyForgotRoute();
  VerifyCreateRoute();
  ResetAccountRoute();
  InitSubscribeRoute();
  SearchRoute();
  PlaylistRoute();
  AddAvatarRoute();
  DiscoverPodcastRoute();
  SetInfoPodcastRoute();
  AddTextAvatarRoute();
  PodcastAvailabilityRoute();
  EditPodcastRoute();
  CreateNewPodcastRoute();
  CreateNewEpisodeRoute();
  CreateNewChannelRoute();
  PlayerRoute();
}
