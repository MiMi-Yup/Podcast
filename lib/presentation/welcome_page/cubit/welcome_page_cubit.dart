import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/use_cases/login_page_usecases.dart';
import 'package:join_podcast/domain/use_cases/welcome_page_usecases.dart';
import 'package:join_podcast/models/user_model.dart';

part 'welcome_page_state.dart';

@injectable
class WelcomePageCubit extends Cubit<WelcomePageState> {
  final WelcomeUseCases welcomeUserCases;

  WelcomePageCubit({required this.welcomeUserCases})
      : super(WelcomePageState.initial());

  void init() {
    // welcomeUserCases
    //     .getPreviousState()
    //     .then((value) => {
    //           if (value == null)
    //             emit(state.copyWith(status: WelcomeStatus.newUser))
    //           else
    //             emit(state.copyWith(status: WelcomeStatus.login, user: value))
    //         })
    //     .catchError((error) =>
    //         {emit(state.copyWith(status: WelcomeStatus.error, user: null))});
    Future.delayed(Duration(seconds: 2))
        .then((value) => emit(state.copyWith(status: WelcomeStatus.newUser)));
  }
}
