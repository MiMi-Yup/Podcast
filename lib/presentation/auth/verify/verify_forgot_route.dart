import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/domain/use_cases/login_page_usecases.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/auth/verify/cubit/verify_cubit.dart';
import 'package:join_podcast/presentation/auth/verify/cubit/verify_forgot_cubit.dart';
import 'package:join_podcast/presentation/auth/verify/ui/verify_screen.dart';

class VerifyForgotRoute extends RouteDefine {
  @override
  List<Path> initRoute(Map? arguments) => [
        Path(
          route: VerifyForgotRoute,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<VerifyCubit>(
                create: (_) => VerifyForgotCubit(
                    usecase: getIt<LoginUseCases>(),
                    email: arguments?['email']),
              ),
            ],
            child: VerifyScreen(),
          ),
        ),
      ];

  static pushAndRemoveAll() {
    XMDRouter.pushNamedAndRemoveUntil(routerIds[VerifyForgotRoute]!);
  }

  static popAndRemoveAll() {
    XMDRouter.popNamedAndRemoveUntil(routerIds[VerifyForgotRoute]!);
  }
}
