import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/domain/use_cases/episode_page_usecase.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/episode/cubit/episode_cubit.dart';
import 'package:join_podcast/presentation/episode/ui/episode_screen.dart';

class EpisodeRoute extends RouteDefine {
  @override
  List<Path> initRoute(Map? arguments) => [
        Path(
          route: EpisodeRoute,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<EpisodeCubit>(
                create: (_) => EpisodeCubit(
                  episodeUseCases: getIt<EpisodeUseCases>(),
                  id: arguments?['id'],
                ),
              ),
            ],
            child: const EpisodeScreen(),
          ),
        )
      ];

  static pushAndRemoveAll() {
    XMDRouter.pushNamedAndRemoveUntil(routerIds[EpisodeRoute]!);
  }

  static popAndRemoveAll() {
    XMDRouter.popNamedAndRemoveUntil(routerIds[EpisodeRoute]!);
  }
}
