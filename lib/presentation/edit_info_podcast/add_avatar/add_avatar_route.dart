import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/edit_info_podcast/add_avatar/ui/add_avatar_screen.dart';

class AddAvatarRoute extends RouteDefine {
  @override
  List<Path> initRoute(Map? arguments) => [
        Path(
          route: AddAvatarRoute,
          builder: (_) => const AddAvatarScreen(),
        ),
      ];

  static pushAndRemoveAll() {
    XMDRouter.pushNamedAndRemoveUntil(routerIds[AddAvatarRoute]!);
  }

  static popAndRemoveAll() {
    XMDRouter.popNamedAndRemoveUntil(routerIds[AddAvatarRoute]!);
  }
}
