import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/presentation/home/home_tab/cubit/home_cubit.dart';
import 'package:join_podcast/presentation/home/home_tab/ui/home_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeCubit>(
          create: (_) => getIt<HomeCubit>(),
        ),
      ],
      child: const HomeScreen(),
    );
  }
}
