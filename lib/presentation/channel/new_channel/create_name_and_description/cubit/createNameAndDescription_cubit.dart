import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';

part 'createNameAndDescription_state.dart';

@injectable
class CreateNameAndDescriptionCubit extends Cubit<CreateNameAndDescriptionState> {
  final UnitOfWork unitOfWork;
  CreateNameAndDescriptionCubit({required this.unitOfWork})
      : super(CreateNameAndDescriptionStateInitial(currentIndex: 0));
  String? get avatar => unitOfWork.session.user?.avatar;
  String? get channelName => unitOfWork.session.user?.channelName;
}
