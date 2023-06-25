import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';

import '../../../../../domain/repositories/unit_of_work.dart';

part 'editPodcast_state.dart';

@injectable
class EditPodcastCubit extends Cubit<EditPodcastState> {
  final UnitOfWork unitOfWork;
  EditPodcastCubit({required this.unitOfWork})
      : super(EditPodcastStateInitial(currentIndex: 0));
}