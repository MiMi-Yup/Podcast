import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';

import '../../../../../domain/repositories/unit_of_work.dart';

part 'createNewPodcast_state.dart';

@injectable
class CreateNewPodcastCubit extends Cubit<CreateNewPodcastState> {
  final UnitOfWork unitOfWork;
  CreateNewPodcastCubit({required this.unitOfWork})
      : super(CreateNewPodcastStateInitial(currentIndex: 0));
}