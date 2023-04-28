part of 'add_info_cubit.dart';

enum Status { initial, submitting, success, error }

class AddInfoState extends Equatable {
  final String? fullname;
  final String? nickname;
  final DateTime? dateOfBirth;
  final String? country;
  final Status state;

  const AddInfoState(
      {required this.fullname,
      required this.nickname,
      required this.dateOfBirth,
      required this.country,
      required this.state});

  factory AddInfoState.initial() {
    return const AddInfoState(
        fullname: null,
        nickname: null,
        dateOfBirth: null,
        country: null,
        state: Status.initial);
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [fullname, nickname, dateOfBirth, country, state];

  AddInfoState copyWith(
          {String? fullname,
          String? nickname,
          DateTime? dateOfBirth,
          String? country,
          Status? state}) =>
      AddInfoState(
          fullname: fullname ?? this.fullname,
          nickname: nickname ?? this.nickname,
          dateOfBirth: dateOfBirth ?? this.dateOfBirth,
          country: country ?? this.country,
          state: state ?? this.state);
}
