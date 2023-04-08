import 'package:join_podcast/presentation/auth/login/login_route.dart';
import 'package:join_podcast/presentation/introduction/introduction_route.dart';
import 'package:join_podcast/presentation/welcome_page/welcome_route.dart';

const routerIds = {
  WelcomeRoute: 'WelcomeRoute',
  LoginRoute: 'LoginRoute',
  IntroductionRoute: 'IntroductionRoute'
};

void generateRoutes() {
  WelcomeRoute();
  LoginRoute();
  IntroductionRoute();
}