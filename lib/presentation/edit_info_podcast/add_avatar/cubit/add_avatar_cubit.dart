import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';

part 'add_avatar_state.dart';

@injectable
class AddAvatarCubit extends Cubit<AddAvatarState> {
  final UnitOfWork unitOfWork;
  AddAvatarCubit({required this.unitOfWork})
      : super(AddAvatarStateInitial(currentIndex: 0));
}
