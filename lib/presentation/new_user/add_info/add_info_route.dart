import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/domain/use_cases/user_usecases.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/new_user/add_info/cubit/add_info_cubit.dart';
import 'package:join_podcast/presentation/new_user/add_info/ui/add_info_screen.dart';

class AddInfoRoute extends RouteDefine {
  @override
  List<Path> initRoute(Map? arguments) => [
        Path(
          route: AddInfoRoute,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<AddInfoCubit>(
                create: (_) => AddInfoCubit(
                    userUserCases: getIt<UserUseCases>(),
                    signUp: arguments?['signUp'] ?? false),
              ),
            ],
            child: AddInfoScreen(),
          ),
        ),
      ];

  static pushAndRemoveAll() {
    XMDRouter.pushNamedAndRemoveUntil(routerIds[AddInfoRoute]!);
  }

  static popAndRemoveAll() {
    XMDRouter.popNamedAndRemoveUntil(routerIds[AddInfoRoute]!);
  }
}
