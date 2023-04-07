import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:join_podcast/manifest.dart';

import 'introduction_page_screen.dart';

class IntroductionPageRoute extends RouteDefine {
  @override
  List<Path> initRoute(Map? arguments) => [
        Path(
            route: IntroductionPageRoute,
            builder: (_) => const IntroductionPageScreen()),
      ];

  static pushAndRemoveAll() {
    XMDRouter.pushNamedAndRemoveUntil(routerIds[IntroductionPageRoute]!);
  }

  static popAndRemoveAll() {
    XMDRouter.popNamedAndRemoveUntil(routerIds[IntroductionPageRoute]!);
  }
}
