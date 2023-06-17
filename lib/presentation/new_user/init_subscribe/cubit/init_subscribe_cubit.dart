import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/use_cases/login_page_usecases.dart';

part 'init_subscribe_state.dart';

@injectable
class InitSubscribeCubit extends Cubit<InitSubscribeState> {
  final LoginUseCases usecase;

  InitSubscribeCubit({required this.usecase})
      : super(InitSubscribeState.initial());

  void addSubscribe(String value) {
    Set<String> subscribed = {...state.subscribed};
    if (subscribed.add(value)) {
      emit(state.copyWith(subscribed: subscribed));
    }
  }

  void removeSubscribe(String value) {
    Set<String> subscribed = {...state.subscribed};
    if (subscribed.remove(value)) {
      emit(state.copyWith(subscribed: subscribed));
    }
  }

  Future<void> updateSubscribe() {
    return Future.delayed(Duration(seconds: 5), () => null);
  }
}
