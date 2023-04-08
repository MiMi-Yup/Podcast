import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/auth/login/cubit/login_cubit.dart';
import 'package:join_podcast/presentation/auth/login/ui/login_screen.dart';

class LoginRoute extends RouteDefine {
  @override
  List<Path> initRoute(Map? arguments) => [
        Path(
          route: LoginRoute,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<LoginCubit>(
                create: (_) => getIt<LoginCubit>(),
              ),
            ],
            child: const LoginScreen(),
          ),
        ),
      ];

  static pushAndRemoveAll() {
    XMDRouter.pushNamedAndRemoveUntil(routerIds[LoginRoute]!);
  }

  static popAndRemoveAll() {
    XMDRouter.popNamedAndRemoveUntil(routerIds[LoginRoute]!);
  }
}