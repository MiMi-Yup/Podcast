import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/di/di.dart';
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
                create: (_) => getIt<PodcastCubit>(),
              ),
            ],
            child: PodcastScreen(
              ordinalNumber: 283,
              networkImage: null,
              onChanged: (value) {},
              onChangeEnd: (value) {},
              title: 'Cuộc đời | Những chuyến đi và bài học đắt giá',
              author: 'Nguyen Hoang Bao Chau',
            ),
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
