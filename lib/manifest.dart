import 'package:join_podcast/presentation/auth/add_info/add_info_route.dart';
import 'package:join_podcast/presentation/auth/login/login_route.dart';
import 'package:join_podcast/presentation/author/author_route.dart';
import 'package:join_podcast/presentation/bottom_bar/bottom_bar_route.dart';
import 'package:join_podcast/presentation/download/download_route.dart';
import 'package:join_podcast/presentation/episode/episode_route.dart';
import 'package:join_podcast/presentation/interested/interested_route.dart';
import 'package:join_podcast/presentation/introduction/introduction_route.dart';
import 'package:join_podcast/presentation/notification/notification_route.dart';
import 'package:join_podcast/presentation/podcast/podcast_route.dart';
import 'package:join_podcast/presentation/record/background_music/background_music_route.dart';
import 'package:join_podcast/presentation/record/list_record/list_record.dart';
import 'package:join_podcast/presentation/record/record_page/record_page_route.dart';
import 'package:join_podcast/presentation/subscription/subscription_route.dart';
import 'package:join_podcast/presentation/welcome_page/welcome_route.dart';

const routerIds = {
  WelcomeRoute: 'WelcomeRoute',
  LoginRoute: 'LoginRoute',
  IntroductionRoute: 'IntroductionRoute',
  AddInfoRoute: "AddInfoRoute",
  InterestedRoute: "InterestedRoute",
  BottomBarRoute: "BottomBarRoute",
  NotificationRoute: "NotificationRoute",
  SubscriptionRoute: "SubscriptionRoute",
  AuthorRoute: "AuthorRoute",
  PodcastRoute: "PodcastRoute",
  BackgroundMusicRoute: "BackgroundMusicRoute",
  RecordPageRoute: "RecordPageRoute",
  EpisodeRoute: "EpisodeRoute",
  DownloadRoute: "DownloadRoute",
  ListRecordPage: "ListRecordPage",
};

void generateRoutes() {
  WelcomeRoute();
  LoginRoute();
  IntroductionRoute();
  AddInfoRoute();
  InterestedRoute();
  BottomBarRoute();
  NotificationRoute();
  SubscriptionRoute();
  AuthorRoute();
  PodcastRoute();
  BackgroundMusicRoute();
  RecordPageRoute();
  EpisodeRoute();
  DownloadRoute();
  ListRecordPage();
}
