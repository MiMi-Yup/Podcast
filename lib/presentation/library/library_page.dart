import 'package:configuration/route/route_define.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/presentation/library/cubit/library_cubit.dart';
import 'package:join_podcast/presentation/library/ui/library_screen.dart';

import '../../manifest.dart';

class LibraryPage extends StatelessWidget {
  const LibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LibraryCubit>(
          create: (_) => getIt<LibraryCubit>(),
        ),
      ],
      child: const LibraryScreen(),
    );
  }
}
