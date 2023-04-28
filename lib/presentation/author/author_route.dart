import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/author/cubit/author_cubit.dart';
import 'package:join_podcast/presentation/author/ui/author_screen.dart';

class AuthorRoute extends RouteDefine {
  @override
  List<Path> initRoute(Map? arguments) => [
        Path(
          route: AuthorRoute,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<AuthorCubit>(
                create: (_) => getIt<AuthorCubit>(),
              ),
            ],
            child: const AuthorScreen(),
          ),
        ),
      ];

  static pushAndRemoveAll() {
    XMDRouter.pushNamedAndRemoveUntil(routerIds[AuthorRoute]!);
  }

  static popAndRemoveAll() {
    XMDRouter.popNamedAndRemoveUntil(routerIds[AuthorRoute]!);
  }
}
