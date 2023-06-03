import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/use_cases/user_usecases.dart';

part 'add_info_state.dart';

@injectable
class AddInfoCubit extends Cubit<AddInfoState> {
  final UserUseCases userUserCases;

  AddInfoCubit({required this.userUserCases}) : super(AddInfoState.initial());

  void changeBirth(DateTime birth) {
    emit(state.copyWith(dateOfBirth: birth));
  }

  void changeName(String name) {
    emit(state.copyWith(fullname: name));
  }

  void changeNickname(String name) {
    emit(state.copyWith(nickname: name));
  }

  void changeCountry(String code) {
    emit(state.copyWith(country: code));
  }

  void changeAvatar(XFile file) {
    emit(state.copyWith(avatar: file));
  }

  Future<void> updateProfile() {
    return Future.delayed(Duration(seconds: 5), () => null);
  }
}
