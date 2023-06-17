import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/use_cases/user_usecases.dart';
import 'package:join_podcast/models/user_model.dart';

part 'welcome_state.dart';

@injectable
class WelcomeCubit extends Cubit<WelcomeState> {
  final UserUseCases usecase;

  WelcomeCubit({required this.usecase}) : super(WelcomeState.initial());

  void init() {
    usecase
        .getPreviousState()
        .then((value) => {
              if (value == null)
                emit(state.copyWith(status: WelcomeStatus.newUser))
              else
                emit(state.copyWith(status: WelcomeStatus.login, user: value))
            })
        .catchError((error) =>
            {emit(state.copyWith(status: WelcomeStatus.error, user: null))});
  }
}
