import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/presentation/channel/new_channel/create_name_and_description/cubit/createNameAndDescription_cubit.dart';
import 'package:join_podcast/presentation/channel/new_channel/create_name_and_description/ui/create_name_and_description_screen.dart';

class CreateNameAndDescription extends StatelessWidget {
  const CreateNameAndDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CreateNameAndDescriptionCubit>(
          create: (_) => getIt<CreateNameAndDescriptionCubit>(),
        ),
      ],
      child: const CreateNameAndDescriptionScreen(),
    );
  }
}
