import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:join_podcast/manifest.dart';

import 'introduction_screen.dart';

class IntroductionRoute extends RouteDefine {
  @override
  List<Path> initRoute(Map? arguments) => [
        Path(
            route: IntroductionRoute,
            builder: (_) => const IntroductionScreen()),
      ];

  static pushAndRemoveAll() {
    XMDRouter.pushNamedAndRemoveUntil(routerIds[IntroductionRoute]!);
  }

  static popAndRemoveAll() {
    XMDRouter.popNamedAndRemoveUntil(routerIds[IntroductionRoute]!);
  }
}
