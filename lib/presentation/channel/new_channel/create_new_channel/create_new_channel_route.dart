import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/presentation/channel/new_channel/create_new_channel/ui/create_new_channel_sceen.dart';
import '../../../../di/di.dart';
import '../../../../manifest.dart';
import 'cubit/create_new_channel_cubit.dart';

class CreateNewChannelRoute extends RouteDefine {
  @override
  List<Path> initRoute(Map? arguments) => [
    Path(
      route: CreateNewChannelRoute,
      builder: (_) => MultiBlocProvider(
        providers: [
          BlocProvider<CreateNewChannelCubit>(
            create: (_) => getIt<CreateNewChannelCubit>(

            ),
          ),
        ],
        child: CreateNewChannelScreen(),
      ),
    )
  ];

  static pushAndRemoveAll() {
    XMDRouter.pushNamedAndRemoveUntil(routerIds[CreateNewChannelRoute]!);
  }

  static popAndRemoveAll() {
    XMDRouter.popNamedAndRemoveUntil(routerIds[CreateNewChannelRoute]!);
  }
}