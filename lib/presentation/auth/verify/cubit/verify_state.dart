import 'package:equatable/equatable.dart';

enum VerifyStatus { initial, checking, failed, confirmed }

class VerifyState extends Equatable {
  final String code;
  final VerifyStatus status;

  const VerifyState({required this.code, required this.status});

  factory VerifyState.initial() =>
      const VerifyState(code: '', status: VerifyStatus.initial);

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props => [code, status];

  VerifyState copyWith({String? code, VerifyStatus? status}) =>
      VerifyState(code: code ?? this.code, status: status ?? this.status);
}
