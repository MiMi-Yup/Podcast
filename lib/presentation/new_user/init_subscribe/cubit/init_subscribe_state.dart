part of 'init_subscribe_cubit.dart';

@immutable
class InitSubscribeState extends Equatable {
  final Set<String> subscribed;

  const InitSubscribeState({required this.subscribed});

  factory InitSubscribeState.initial() =>
      const InitSubscribeState(subscribed: {});

  @override
  List<Object?> get props => [subscribed];

  InitSubscribeState copyWith({Set<String>? subscribed}) {
    return InitSubscribeState(subscribed: subscribed ?? this.subscribed);
  }
}
