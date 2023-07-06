import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';

part 'create_new_channel_state.dart';

@injectable
class CreateNewChannelCubit extends Cubit<CreateNewChannelState> {
  final UnitOfWork unitOfWork;
  CreateNewChannelCubit({required this.unitOfWork})
      : super(CreateNewChannelStateInitial(currentIndex: 0));
}
