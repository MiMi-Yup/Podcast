import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/domain/use_cases/episode_page_usecase.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/podcast/cubit/podcast_cubit.dart';
import 'package:join_podcast/presentation/podcast/ui/podcast_screen.dart';

class PodcastRoute extends RouteDefine {
  @override
  List<Path> initRoute(Map? arguments) => [
        Path(
          route: PodcastRoute,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<PodcastCubit>(
                create: (_) => PodcastCubit(
                  episodeUseCases: getIt<EpisodeUseCases>(),
                  id: arguments?['id'],
                ),
              ),
            ],
            child: const PodcastScreen(),
          ),
        )
      ];

  static pushAndRemoveAll() {
    XMDRouter.pushNamedAndRemoveUntil(routerIds[PodcastRoute]!);
  }

  static popAndRemoveAll() {
    XMDRouter.popNamedAndRemoveUntil(routerIds[PodcastRoute]!);
  }
}
