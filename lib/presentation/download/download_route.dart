import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/download/cubit/download_cubit.dart';
import 'package:join_podcast/presentation/download/ui/download_screen.dart';

class DownloadRoute extends RouteDefine {
  @override
  List<Path> initRoute(Map? arguments) => [
        Path(
          route: DownloadRoute,
          builder: (_) => BlocProvider(
            create: (_) => getIt<DownloadCubit>(),
            child: const DownloadScreen(),
          ),
        ),
      ];

  static pushAndRemoveAll() {
    XMDRouter.pushNamedAndRemoveUntil(routerIds[DownloadRoute]!);
  }

  static popAndRemoveAll() {
    XMDRouter.popNamedAndRemoveUntil(routerIds[DownloadRoute]!);
  }
}
