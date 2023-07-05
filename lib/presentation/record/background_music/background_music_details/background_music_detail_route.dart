import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/record/background_music/background_music_details/ui/background_music_detail_screen.dart';

class BackgroundMusicDetailRoute extends RouteDefine {
  @override
  List<Path> initRoute(Map? arguments) => [
        Path(
          route: BackgroundMusicDetailRoute,
          builder: (_) =>
              const BackgroundMusicDetailScreen(title: 'test'/*arguments!['title']*/),
        ),
      ];

  static pushAndRemoveAll() {
    XMDRouter.pushNamedAndRemoveUntil(routerIds[BackgroundMusicDetailRoute]!);
  }

  static popAndRemoveAll() {
    XMDRouter.popNamedAndRemoveUntil(routerIds[BackgroundMusicDetailRoute]!);
  }
}
