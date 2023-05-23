import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/record/background_music/background_music_home/cubit/background_music_home_cubit.dart';
import 'package:join_podcast/presentation/record/background_music/background_music_home/ui/background_music_home_screen.dart';

class BackgroundMusicHomeRoute extends RouteDefine {
  @override
  List<Path> initRoute(Map? arguments) => [
        Path(
          route: BackgroundMusicHomeRoute,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<BackgroundMusicHomeCubit>(
                create: (_) => getIt<BackgroundMusicHomeCubit>(),
              ),
            ],
            child: const BackgroundMusicHomeScreen(),
          ),
        )
      ];

  static pushAndRemoveAll() {
    XMDRouter.pushNamedAndRemoveUntil(routerIds[BackgroundMusicHomeRoute]!);
  }

  static popAndRemoveAll() {
    XMDRouter.popNamedAndRemoveUntil(routerIds[BackgroundMusicHomeRoute]!);
  }
}
