import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';

part 'podcast_availability_state.dart';

@injectable
class PodcastAvailabilityCubit extends Cubit<PodcastAvailabilityState> {
  final UnitOfWork unitOfWork;
  PodcastAvailabilityCubit({required this.unitOfWork})
      : super(PodcastAvailabilityStateInitial(currentIndex: 0));
}

