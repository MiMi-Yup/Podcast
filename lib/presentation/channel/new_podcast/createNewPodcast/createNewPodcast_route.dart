import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/presentation/channel/new_podcast/createNewPodcast/ui/createNewPodcast_screen.dart';
import '../../../../di/di.dart';
import '../../../../manifest.dart';
import 'cubit/createNewPodcast_cubit.dart';

class CreateNewPodcastRoute extends RouteDefine {
  @override
  List<Path> initRoute(Map? arguments) => [
    Path(
      route: CreateNewPodcastRoute,
      builder: (_) => MultiBlocProvider(
        providers: [
          BlocProvider<CreateNewPodcastCubit>(
            create: (_) => getIt<CreateNewPodcastCubit>(),
          ),
        ],
        child: CreateNewPodcastScreen(),
      ),
    )
  ];

  static pushAndRemoveAll() {
    XMDRouter.pushNamedAndRemoveUntil(routerIds[CreateNewPodcastRoute]!);
  }

  static popAndRemoveAll() {
    XMDRouter.popNamedAndRemoveUntil(routerIds[CreateNewPodcastRoute]!);
  }
}