import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/detail_episode/ui/detail_episode_screen.dart';

class DetailEpisodeRoute extends RouteDefine {
  @override
  List<Path> initRoute(Map? arguments) => [
        Path(
          route: DetailEpisodeRoute,
          builder: (_) => const DetailEpisodeScreen(),
        ),
      ];

  static pushAndRemoveAll() {
    XMDRouter.pushNamedAndRemoveUntil(routerIds[DetailEpisodeRoute]!);
  }

  static popAndRemoveAll() {
    XMDRouter.popNamedAndRemoveUntil(routerIds[DetailEpisodeRoute]!);
  }
}
