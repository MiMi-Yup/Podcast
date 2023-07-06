import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/presentation/channel/new_episode/ui/createNewEpisode_screen.dart';
import '../../../../di/di.dart';
import '../../../../manifest.dart';
import 'cubit/createNewEpisode_cubit.dart';

class CreateNewEpisodeRoute extends RouteDefine {
  @override
  List<Path> initRoute(Map? arguments) => [
    Path(
      route: CreateNewEpisodeRoute,
      builder: (_) => MultiBlocProvider(
        providers: [
          BlocProvider<CreateNewEpisodeCubit>(
            create: (_) => getIt<CreateNewEpisodeCubit>(),
          ),
        ],
        child: const CreateNewEpisodeScreen(),
      ),
    )
  ];

  static pushAndRemoveAll() {
    XMDRouter.pushNamedAndRemoveUntil(routerIds[CreateNewEpisodeRoute]!);
  }

  static popAndRemoveAll() {
    XMDRouter.popNamedAndRemoveUntil(routerIds[CreateNewEpisodeRoute]!);
  }
}