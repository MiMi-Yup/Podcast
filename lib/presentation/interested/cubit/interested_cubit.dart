import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/use_cases/login_page_usecases.dart';

part 'interested_state.dart';

@injectable
class InterestedCubit extends Cubit<InterestedState> {
  final LoginUseCases loginUserCases;

  InterestedCubit({required this.loginUserCases})
      : super(InterestedState.initial());
}
