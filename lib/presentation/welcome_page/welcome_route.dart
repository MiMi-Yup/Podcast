import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/welcome_page/cubit/welcome_cubit.dart';
import 'package:join_podcast/presentation/welcome_page/ui/welcome_screen.dart';

class WelcomeRoute extends RouteDefine {
  @override
  List<Path> initRoute(Map? arguments) => [
        Path(
          route: WelcomeRoute,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<WelcomeCubit>(
                create: (_) => getIt<WelcomeCubit>(),
              ),
            ],
            child: const WelcomeScreen(),
          ),
        ),
      ];

  static pushAndRemoveAll() {
    XMDRouter.pushNamedAndRemoveUntil(routerIds[WelcomeRoute]!);
  }

  static popAndRemoveAll() {
    XMDRouter.popNamedAndRemoveUntil(routerIds[WelcomeRoute]!);
  }
}