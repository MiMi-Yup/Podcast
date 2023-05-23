import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/domain/use_cases/login_page_usecases.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/auth/reset/cubit/reset_cubit.dart';
import 'package:join_podcast/presentation/auth/reset/ui/reset_screen.dart';

class ResetAccountRoute extends RouteDefine {
  @override
  List<Path> initRoute(Map? arguments) => [
        Path(
          route: ResetAccountRoute,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<ResetAccountCubit>(
                create: (_) => ResetAccountCubit(
                    loginUserCases: getIt<LoginUseCases>(),
                    token: arguments?['token']),
              ),
            ],
            child: ResetAccountScreen(),
          ),
        ),
      ];

  static pushAndRemoveAll() {
    XMDRouter.pushNamedAndRemoveUntil(routerIds[ResetAccountRoute]!);
  }

  static popAndRemoveAll() {
    XMDRouter.popNamedAndRemoveUntil(routerIds[ResetAccountRoute]!);
  }
}
