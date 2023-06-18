import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';

part 'set_info_podcast_state.dart';

@injectable
class SetInfoPodcastCubit extends Cubit<SetInfoPodcastState> {
  final UnitOfWork unitOfWork;
  SetInfoPodcastCubit({required this.unitOfWork})
      : super(SetInfoPodcastStateInitial(currentIndex: 0));
}
