import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/history/cubit/history_cubit.dart';
import 'package:join_podcast/presentation/history/ui/history_screen.dart';

class HistoryRoute extends RouteDefine {
  @override
  List<Path> initRoute(Map? arguments) => [
        Path(
          route: HistoryRoute,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<HistoryCubit>(
                create: (_) => getIt<HistoryCubit>(),
              ),
            ],
            child: const HistoryScreen(),
          ),
        ),
      ];

  static pushAndRemoveAll() {
    XMDRouter.pushNamedAndRemoveUntil(routerIds[HistoryRoute]!);
  }

  static popAndRemoveAll() {
    XMDRouter.popNamedAndRemoveUntil(routerIds[HistoryRoute]!);
  }
}
