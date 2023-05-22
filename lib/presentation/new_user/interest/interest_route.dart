import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/new_user/interest/cubit/interest_cubit.dart';
import 'package:join_podcast/presentation/new_user/interest/ui/interest_screen.dart';

class InterestRoute extends RouteDefine {
  @override
  List<Path> initRoute(Map? arguments) => [
        Path(
          route: InterestRoute,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<InterestCubit>(
                create: (_) => getIt<InterestCubit>(),
              ),
            ],
            child: InterestScreen(),
          ),
        ),
      ];

  static pushAndRemoveAll() {
    XMDRouter.pushNamedAndRemoveUntil(routerIds[InterestRoute]!);
  }

  static popAndRemoveAll() {
    XMDRouter.popNamedAndRemoveUntil(routerIds[InterestRoute]!);
  }
}
