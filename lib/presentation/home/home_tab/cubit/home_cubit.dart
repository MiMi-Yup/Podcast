import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';
import 'package:join_podcast/models/episode_model.dart';
import 'package:join_podcast/models/podcast_model.dart';

part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  final UnitOfWork unitOfWork;
  HomeCubit({required this.unitOfWork})
      : super(HomeStateInitial(currentIndex: 0));

  String? get userName => unitOfWork.session.user?.name;
  String? get email => unitOfWork.session.user?.email;
  String? get avatar => unitOfWork.session.user?.avatar;

  Future<List<EpisodeModel>> getNewest() async {
    final result = await unitOfWork.episode.getNewest();
    if ((result?.count ?? 0) > 0 && result?.items != null) {
      return result!.items!.map((e) => e.toModel()).toList();
    } else {
      return [];
    }
  }

  Future<List<EpisodeModel>> getMostListened() async {
    final result = await unitOfWork.episode.getMostListened();
    if ((result?.count ?? 0) > 0 && result?.items != null) {
      return result!.items!.map((e) => e.toModel()).toList();
    } else {
      return [];
    }
  }

  Future<List<PodcastModel>> getSubscribed() async {
    final result = await unitOfWork.user.getSubcribed();
    if ((result?.count ?? 0) > 0 && result?.items != null) {
      return result!.items!.map((e) => PodcastModel.fromResponse(e)).toList();
    } else {
      return [];
    }
  }
}
