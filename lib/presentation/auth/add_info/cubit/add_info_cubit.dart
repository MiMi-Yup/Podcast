import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/use_cases/login_page_usecases.dart';

part 'add_info_state.dart';

@injectable
class AddInfoCubit extends Cubit<AddInfoState> {
  final LoginUseCases loginUserCases;

  AddInfoCubit({required this.loginUserCases}) : super(AddInfoState.initial());
}
