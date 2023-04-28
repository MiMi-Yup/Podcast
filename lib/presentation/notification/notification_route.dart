import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/notification/cubit/notification_cubit.dart';
import 'package:join_podcast/presentation/notification/ui/notification_screen.dart';

class NotificationRoute extends RouteDefine {
  @override
  List<Path> initRoute(Map? arguments) => [
        Path(
          route: NotificationRoute,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<NotificationCubit>(
                create: (_) => getIt<NotificationCubit>(),
              ),
            ],
            child: const NotificationScreen(),
          ),
        ),
      ];

  static pushAndRemoveAll() {
    XMDRouter.pushNamedAndRemoveUntil(routerIds[NotificationRoute]!);
  }

  static popAndRemoveAll() {
    XMDRouter.popNamedAndRemoveUntil(routerIds[NotificationRoute]!);
  }
}
