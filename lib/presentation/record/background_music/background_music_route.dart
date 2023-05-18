import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/record/background_music/cubit/background_music_cubit.dart';
import 'package:join_podcast/presentation/record/background_music/ui/background_music_screen.dart';

class BackgroundMusicRoute extends RouteDefine {
  @override
  List<Path> initRoute(Map? arguments) => [
        Path(
          route: BackgroundMusicRoute,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<BackgroundMusicCubit>(
                create: (_) => getIt<BackgroundMusicCubit>(),
              ),
            ],
            child: const BackgroundMusicScreen(),
          ),
        )
      ];

  static pushAndRemoveAll() {
    XMDRouter.pushNamedAndRemoveUntil(routerIds[BackgroundMusicRoute]!);
  }

  static popAndRemoveAll() {
    XMDRouter.popNamedAndRemoveUntil(routerIds[BackgroundMusicRoute]!);
  }
}
