import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/playlist/cubit/playlist_cubit.dart';
import 'package:join_podcast/presentation/playlist/ui/playlist_screen.dart';

class PlaylistRoute extends RouteDefine {
  @override
  List<Path> initRoute(Map? arguments) => [
        Path(
          route: PlaylistRoute,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<PlaylistCubit>(
                create: (_) => getIt<PlaylistCubit>(),
              ),
            ],
            child: const PlaylistScreen(),
          ),
        ),
      ];

  static pushAndRemoveAll() {
    XMDRouter.pushNamedAndRemoveUntil(routerIds[PlaylistRoute]!);
  }

  static popAndRemoveAll() {
    XMDRouter.popNamedAndRemoveUntil(routerIds[PlaylistRoute]!);
  }
}