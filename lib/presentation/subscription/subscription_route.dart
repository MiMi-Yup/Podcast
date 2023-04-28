import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/subscription/cubit/subscription_cubit.dart';

import 'ui/subscription_screen.dart';

class SubscriptionRoute extends RouteDefine {
  @override
  List<Path> initRoute(Map? arguments) => [
        Path(
          route: SubscriptionRoute,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<SubscriptionCubit>(
                create: (_) => getIt<SubscriptionCubit>(),
              ),
            ],
            child: const SubscriptionScreen(),
          ),
        ),
      ];

  static pushAndRemoveAll() {
    XMDRouter.pushNamedAndRemoveUntil(routerIds[SubscriptionRoute]!);
  }

  static popAndRemoveAll() {
    XMDRouter.popNamedAndRemoveUntil(routerIds[SubscriptionRoute]!);
  }
}
