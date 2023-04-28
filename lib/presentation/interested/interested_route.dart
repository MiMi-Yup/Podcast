import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/interested/cubit/interested_cubit.dart';
import 'package:join_podcast/presentation/interested/ui/interested_screen.dart';

class InterestedRoute extends RouteDefine {
  @override
  List<Path> initRoute(Map? arguments) => [
        Path(
          route: InterestedRoute,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<InterestedCubit>(
                create: (_) => getIt<InterestedCubit>(),
              ),
            ],
            child: const InterestedScreen(),
          ),
        ),
      ];

  static pushAndRemoveAll() {
    XMDRouter.pushNamedAndRemoveUntil(routerIds[InterestedRoute]!);
  }

  static popAndRemoveAll() {
    XMDRouter.popNamedAndRemoveUntil(routerIds[InterestedRoute]!);
  }
}
