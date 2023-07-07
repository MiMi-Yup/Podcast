import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            create: (_) => (getIt<EditPodcastCubit>()),
          ),
        ],
        child: PodcastEditingScreen(
          podcastName: 'Lâm và Gia Huy',
          podcastImage: null,
          totalListens: 100, // Số lượt nghe
          episodeList: [Episode('Episode 1', 'Mô tả episode 1'), Episode('Episode 2', 'Mô tả episode 2')],
        ),
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