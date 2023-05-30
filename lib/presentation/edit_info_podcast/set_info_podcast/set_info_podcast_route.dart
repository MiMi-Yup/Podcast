import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/edit_info_podcast/set_info_podcast/ui/set_info_podcast_screen.dart';

class SetInfoPodcastRoute extends RouteDefine {
  @override
  List<Path> initRoute(Map? arguments) => [
        Path(
          route: SetInfoPodcastRoute,
          builder: (_) => const SetInfoPodcastScreen(),
        ),
      ];

  static pushAndRemoveAll() {
    XMDRouter.pushNamedAndRemoveUntil(routerIds[SetInfoPodcastRoute]!);
  }

  static popAndRemoveAll() {
    XMDRouter.popNamedAndRemoveUntil(routerIds[SetInfoPodcastRoute]!);
  }
}
