import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/data/data_source/runtime/player_storage_service.dart';
import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/domain/use_cases/episode_page_usecase.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/models/episode_model.dart';
import 'package:join_podcast/presentation/player/cubit/player_cubit.dart';
import 'package:join_podcast/presentation/player/ui/player_screen.dart';

class PlayerRoute extends RouteDefine {
  @override
  List<Path> initRoute(Map? arguments) => [
        Path(
          route: PlayerRoute,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<PlayerCubit>(
                create: (_) => PlayerCubit(
                  episodeUseCases: getIt<EpisodeUseCases>(),
                  episodePlayerManager: getIt<EpisodePlayerManager>(),
                  id: arguments?['id'],
                  listEpisodes:
                      arguments?['listEpisodes'] as List<EpisodeModel>,
                ),
              ),
            ],
            child: const PlayerScreen(),
          ),
        )
      ];

  static pushAndRemoveAll() {
    XMDRouter.pushNamedAndRemoveUntil(routerIds[PlayerRoute]!);
  }

  static popAndRemoveAll() {
    XMDRouter.popNamedAndRemoveUntil(routerIds[PlayerRoute]!);
  }
}
