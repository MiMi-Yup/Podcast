import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';

import '../../../../../domain/repositories/unit_of_work.dart';

part 'createNewEpisode_state.dart';

@injectable
class CreateNewEpisodeCubit extends Cubit<CreateNewEpisodeState> {
  final UnitOfWork unitOfWork;
  CreateNewEpisodeCubit({required this.unitOfWork})
      : super(CreateNewEpisodeStateInitial(currentIndex: 0));
}