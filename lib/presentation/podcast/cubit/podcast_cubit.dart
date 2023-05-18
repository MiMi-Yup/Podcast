import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';

part 'podcast_state.dart';

@injectable
class PodcastCubit extends Cubit<PodcastState> {
  final UnitOfWork unitOfWork;
  PodcastCubit({required this.unitOfWork})
      : super(PodcastStateInitial(currentIndex: 0));
}
