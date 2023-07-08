import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/domain/use_cases/episode_page_usecase.dart';
import 'package:join_podcast/domain/use_cases/podcast_usecase.dart';
import 'package:join_podcast/presentation/channel/new_podcast/editPodcast/ui/editPodcast_screen.dart';
import 'package:path/path.dart';
import '../../../../di/di.dart';
import '../../../../manifest.dart';
import 'cubit/editPodcast_cubit.dart';

class EditPodcastRoute extends RouteDefine {
  @override
  List<Path> initRoute(Map? arguments) => [
        Path(
          route: EditPodcastRoute,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<EditPodcastCubit>(
                create: (_) => EditPodcastCubit(
                    episodeUseCases: getIt<EpisodeUseCases>(),
                    podcastUseCases: getIt<PodcastUseCases>(),
                    idPodcast: arguments?['id']),
              ),
            ],
            child: const PodcastEditingScreen(),
          ),
        )
      ];

  static pushAndRemoveAll() {
    XMDRouter.pushNamedAndRemoveUntil(routerIds[EditPodcastRoute]!);
  }

  static popAndRemoveAll() {
    XMDRouter.popNamedAndRemoveUntil(routerIds[EditPodcastRoute]!);
  }
}
