import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/edit_info_podcast/podcast_availability/ui/podcast_availability_screen.dart';

class PodcastAvailabilityRoute extends RouteDefine {
  @override
  List<Path> initRoute(Map? arguments) => [
        Path(
          route: PodcastAvailabilityRoute,
          builder: (_) => const PodcastAvailabilityScreen(),
        ),
      ];

  static pushAndRemoveAll() {
    XMDRouter.pushNamedAndRemoveUntil(routerIds[PodcastAvailabilityRoute]!);
  }

  static popAndRemoveAll() {
    XMDRouter.popNamedAndRemoveUntil(routerIds[PodcastAvailabilityRoute]!);
  }
}
