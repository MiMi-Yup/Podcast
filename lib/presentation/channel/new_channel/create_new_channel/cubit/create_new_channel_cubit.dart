import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';
import 'package:join_podcast/models/request/users/create_channel_request.dart';

import '../../../../../domain/use_cases/user_usecases.dart';
import '../../../../../models/user_model.dart';

part 'create_new_channel_state.dart';

@injectable
class CreateNewChannelCubit extends Cubit<CreateNewChannelState> {
  final UserUseCases usecase;
  CreateNewChannelCubit({required this.usecase})
      : super(CreateNewChannelState.initial());

  void setChannel(String channelName) {
    emit(state.copyWith(channelName: channelName));
  }

  void createChannel() async {
      usecase.unitOfWork.user.createChannel(CreateChannelRequest(name: state.channelName));
  }


}
