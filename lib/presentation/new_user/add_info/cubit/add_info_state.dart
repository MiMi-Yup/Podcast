part of 'add_info_cubit.dart';

enum Status { initial, submitting, success, error }

class AddInfoState extends Equatable {
  final String? avatar;
  final String initAvatar;
  final String? fullname;
  final DateTime? dateOfBirth;
  final Status state;
  final bool signUp;

  const AddInfoState(
      {required this.fullname,
      required this.dateOfBirth,
      required this.state,
      required this.avatar,
      this.initAvatar =
          'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png',
      this.signUp = false});

  factory AddInfoState.initial({bool signUp = false}) {
    return AddInfoState(
        fullname: null,
        dateOfBirth: null,
        avatar: null,
        state: Status.initial,
        signUp: signUp);
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props =>
      [fullname, dateOfBirth, state, avatar, initAvatar, signUp];

  AddInfoState copyWith(
          {String? fullname,
          DateTime? dateOfBirth,
          Status? state,
          String? avatar,
          String? initAvatar}) =>
      AddInfoState(
          fullname: fullname ?? this.fullname,
          dateOfBirth: dateOfBirth ?? this.dateOfBirth,
          state: state ?? this.state,
          avatar: avatar ?? this.avatar,
          initAvatar: initAvatar ?? this.initAvatar,
          signUp: signUp);
}
