import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/home/search/cubit/search_cubit.dart';
import 'package:join_podcast/presentation/home/search/ui/search_screen.dart';

class SearchRoute extends RouteDefine {
  @override
  List<Path> initRoute(Map? arguments) => [
        Path(
          route: SearchRoute,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<SearchCubit>(
                create: (_) => getIt<SearchCubit>(),
              ),
            ],
            child: const SearchScreen(),
          ),
        ),
      ];

  static pushAndRemoveAll() {
    XMDRouter.pushNamedAndRemoveUntil(routerIds[SearchRoute]!);
  }

  static popAndRemoveAll() {
    XMDRouter.popNamedAndRemoveUntil(routerIds[SearchRoute]!);
  }
}
