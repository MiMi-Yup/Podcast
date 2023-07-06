import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/presentation/record/list_record/cubit/list_record_cubit.dart';
import 'package:join_podcast/presentation/record/list_record/ui/list_record_screen.dart';

import '../../../manifest.dart';

class ListRecordRoute extends RouteDefine {
  @override
  List<Path> initRoute(Map? arguments) => [
    Path(
      route: ListRecordRoute,
      builder: (_) => MultiBlocProvider(
        providers: [
          BlocProvider<ListRecordCubit>(
            create: (_) => getIt<ListRecordCubit>(),
          ),
        ],
        child:  const ListRecordScreen(),
      ),
    ),
  ];

  static pushAndRemoveAll() {
    XMDRouter.pushNamedAndRemoveUntil(routerIds[ListRecordRoute]!);
  }

  static popAndRemoveAll() {
    XMDRouter.popNamedAndRemoveUntil(routerIds[ListRecordRoute]!);
  }
}
