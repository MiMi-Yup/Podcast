import 'package:join_podcast/presentation/auth/login/login_page_route.dart';
import 'package:join_podcast/presentation/introduction_page/introduction_page_route.dart';
import 'package:join_podcast/presentation/welcome_page/welcome_page_route.dart';

const routerIds = {
  WelcomePageRoute: 'WelcomePageRoute',
  LoginPageRoute: 'LoginPageRoute',
  IntroductionPageRoute: 'IntroductionPageRoute'
};

void generateRoutes() {
  WelcomePageRoute();
  LoginPageRoute();
  IntroductionPageRoute();
}