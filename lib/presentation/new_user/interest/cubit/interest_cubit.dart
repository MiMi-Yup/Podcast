import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/use_cases/login_page_usecases.dart';

part 'interest_state.dart';

@injectable
class InterestCubit extends Cubit<InterestState> {
  final LoginUseCases loginUserCases;

  InterestCubit({required this.loginUserCases})
      : super(InterestState.initial());

  void changeInterest(List<String> value) {
    emit(state.copyWith(interested: value.toSet()));
  }

  Future<void> updateInterest() {
    return Future.delayed(Duration(seconds: 5), () => null);
  }
}
