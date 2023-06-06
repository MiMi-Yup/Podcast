import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/use_cases/user_usecases.dart';
import 'package:join_podcast/models/user_model.dart';

part 'add_info_state.dart';

@injectable
class AddInfoCubit extends Cubit<AddInfoState> {
  final UserUseCases userUserCases;

  AddInfoCubit({required this.userUserCases}) : super(AddInfoState.initial()) {
    userUserCases.getPreviousState().then((value) {
      if (value != null) {
        emit(state.copyWith(
            fullname: value.name, dateOfBirth: value.birthday, initAvatar: value.avatar));
      }
    }).onError((error, stackTrace) => null);
  }

  void changeBirth(DateTime birth) {
    emit(state.copyWith(dateOfBirth: birth));
  }

  void changeName(String name) {
    emit(state.copyWith(fullname: name));
  }

  void changeAvatar(XFile file) {
    emit(state.copyWith(avatar: file.path));
  }

  void updateProfile() async {
    emit(state.copyWith(state: Status.submitting));
    UserModel? newUpdate = await userUserCases
        .updateInfo(
            avatar: state.avatar, dob: state.dateOfBirth, name: state.fullname)
        .onError((error, stackTrace) {
      emit(state.copyWith(state: Status.error));
      return null;
    });
    if (newUpdate != null) {
      userUserCases.unitOfWork.session.updateUser(user: newUpdate);
      emit(state.copyWith(state: Status.success));
    } else {
      emit(state.copyWith(state: Status.error));
    }
  }
}
