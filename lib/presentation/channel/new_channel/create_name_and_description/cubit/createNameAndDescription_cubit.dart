import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';
import 'package:join_podcast/models/channel_model.dart';
import 'package:join_podcast/models/podcast_model.dart';

part 'createNameAndDescription_state.dart';

@injectable
class CreateNameAndDescriptionCubit
    extends Cubit<CreateNameAndDescriptionState> {
  final UnitOfWork unitOfWork;
  CreateNameAndDescriptionCubit({required this.unitOfWork})
      : super(CreateNameAndDescriptionState.initial());

  String? get avatar => unitOfWork.session.user?.avatar;
  String? get channelName => unitOfWork.session.user?.channelName;

  void init() async {
    final channel = await unitOfWork.user.getSelfChannel();
    if (channel != null && !isClosed) {
      final channelModel = ChannelModel.fromJson(channel.toJson());
      emit(state.copyWith(
          podcasts: channelModel.podcasts?.items,
          nameChannel: channelModel.channelName,
          countPodcast: channelModel.podcasts?.count ?? 0,
          countListened: channelModel.podcasts?.items
              ?.map((e) => e.numListening)
              .reduce((value, element) => (value ?? 0) + (element ?? 0))));
    }
  }
}
