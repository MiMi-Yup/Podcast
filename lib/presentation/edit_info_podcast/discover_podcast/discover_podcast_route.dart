import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/edit_info_podcast/discover_podcast/ui/discover_podcast_screen.dart';

class DiscoverPodcastRoute extends RouteDefine {
  @override
  List<Path> initRoute(Map? arguments) => [
        Path(
          route: DiscoverPodcastRoute,
          builder: (_) => const DiscoverPodcastScreen(),
        ),
      ];

  static pushAndRemoveAll() {
    XMDRouter.pushNamedAndRemoveUntil(routerIds[DiscoverPodcastRoute]!);
  }

  static popAndRemoveAll() {
    XMDRouter.popNamedAndRemoveUntil(routerIds[DiscoverPodcastRoute]!);
  }
}
