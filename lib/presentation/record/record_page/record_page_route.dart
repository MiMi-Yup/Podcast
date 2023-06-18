import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/presentation/record/record_page/ui/record_page_screen.dart';

import '../../../di/di.dart';
import '../../../manifest.dart';
import '../list_record/cubit/list_record_cubit.dart';
import 'cubit/record_page_cubit.dart';

class RecordPageRoute extends RouteDefine {
  @override
  List<Path> initRoute(Map? arguments) => [
    Path(
      route: RecordPageRoute,
      builder: (_) => MultiBlocProvider(
        providers: [
          BlocProvider<RecordPageCubit>(
            create: (_) => getIt<RecordPageCubit>(),
          ),
          BlocProvider<ListRecordCubit>(
            create: (_) => getIt<ListRecordCubit>(),
          ),
        ],
        child: RecordingPageScreen(),
      ),
    )
  ];

  static pushAndRemoveAll() {
    XMDRouter.pushNamedAndRemoveUntil(routerIds[RecordPageRoute]!);
  }

  static popAndRemoveAll() {
    XMDRouter.popNamedAndRemoveUntil(routerIds[RecordPageRoute]!);
  }
}