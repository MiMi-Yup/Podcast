import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';

part 'author_state.dart';

@injectable
class AuthorCubit extends Cubit<AuthorState> {
  final UnitOfWork unitOfWork;
  AuthorCubit({required this.unitOfWork})
      : super(AuthorStateInitial(currentIndex: 0));
}
