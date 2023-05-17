import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/presentation/record/list_record/cubit/list_record_cubit.dart';
import 'package:join_podcast/presentation/record/list_record/ui/list_record_screen.dart';

class ListRecordPage extends StatelessWidget {
  const ListRecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ListRecordCubit>(
          create: (_) => getIt<ListRecordCubit>(),
        ),
      ],
      child: const  ListRecordScreen(),
    );
  }
}
