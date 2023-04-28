import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/presentation/bottom_bar/cubit/bottom_bar_cubit.dart';
import 'package:join_podcast/presentation/bottom_bar/ui/bottom_bar_screen.dart';

import '../../manifest.dart';

class BottomBarRoute extends RouteDefine {
  @override
  List<Path> initRoute(Map? arguments) => [
        Path(
          route: BottomBarRoute,
          builder: (_) => BlocProvider(
            create: (_) => getIt<BottomBarCubit>(),
            child: BottomBarScreen(),
          ),
        ),
      ];

  static pushAndRemoveAll() {
    XMDRouter.pushNamedAndRemoveUntil(routerIds[BottomBarRoute]!);
  }

  static popAndRemoveAll() {
    XMDRouter.popNamedAndRemoveUntil(routerIds[BottomBarRoute]!);
  }
}
