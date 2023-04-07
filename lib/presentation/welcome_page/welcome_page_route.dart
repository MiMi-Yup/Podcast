import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/welcome_page/cubit/welcome_page_cubit.dart';
import 'package:join_podcast/presentation/welcome_page/ui/welcome_page_screen.dart';

class WelcomePageRoute extends RouteDefine {
  @override
  List<Path> initRoute(Map? arguments) => [
        Path(
          route: WelcomePageRoute,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<WelcomePageCubit>(
                create: (_) => getIt<WelcomePageCubit>(),
              ),
            ],
            child: const WelcomePageScreen(),
          ),
        ),
      ];

  static pushAndRemoveAll() {
    XMDRouter.pushNamedAndRemoveUntil(routerIds[WelcomePageRoute]!);
  }

  static popAndRemoveAll() {
    XMDRouter.popNamedAndRemoveUntil(routerIds[WelcomePageRoute]!);
  }
}