import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';

part 'discover_podcaststate.dart';

@injectable
class DiscoverPodcastCubit extends Cubit<DiscoverPodcastState> {
  final UnitOfWork unitOfWork;
  DiscoverPodcastCubit({required this.unitOfWork})
      : super(DiscoverPodcastStateInitial(currentIndex: 0));
}
