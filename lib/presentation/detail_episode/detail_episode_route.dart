import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/detail_episode/cubit/detail_episode_cubit.dart';
import 'package:join_podcast/presentation/detail_episode/ui/detail_episode_screen.dart';

class DetailEpisodeRoute extends RouteDefine {
  @override
  List<Path> initRoute(Map? arguments) => [
        Path(
          route: DetailEpisodeRoute,
          builder: (_) => BlocProvider(
            create: (_) => DetailEpisodeCubit(
                unitOfWork: getIt<UnitOfWork>(),
                episode: arguments?['episode']),
            child: const DetailEpisodeScreen(),
          ),
        ),
      ];

  static pushAndRemoveAll() {
    XMDRouter.pushNamedAndRemoveUntil(routerIds[DetailEpisodeRoute]!);
  }

  static popAndRemoveAll() {
    XMDRouter.popNamedAndRemoveUntil(routerIds[DetailEpisodeRoute]!);
  }
}
