import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/new_user/init_subscribe/cubit/init_subscribe_cubit.dart';
import 'package:join_podcast/presentation/new_user/init_subscribe/ui/init_subscribe_screen.dart';

class InitSubscribeRoute extends RouteDefine {
  @override
  List<Path> initRoute(Map? arguments) => [
        Path(
          route: InitSubscribeRoute,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<InitSubscribeCubit>(
                create: (_) => getIt<InitSubscribeCubit>(),
              ),
            ],
            child: const InitSubscribeScreen(),
          ),
        ),
      ];

  static pushAndRemoveAll() {
    XMDRouter.pushNamedAndRemoveUntil(routerIds[InitSubscribeRoute]!);
  }

  static popAndRemoveAll() {
    XMDRouter.popNamedAndRemoveUntil(routerIds[InitSubscribeRoute]!);
  }
}
