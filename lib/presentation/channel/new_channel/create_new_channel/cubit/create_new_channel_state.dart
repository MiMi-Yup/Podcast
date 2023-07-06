part of 'create_new_channel_cubit.dart';

@immutable
abstract class CreateNewChannelState extends Equatable {}

class CreateNewChannelStateInitial extends CreateNewChannelState {
  final int currentIndex;
  final bool isHidden;

  CreateNewChannelStateInitial({required this.currentIndex, this.isHidden = false});

  @override
  List<Object?> get props => [currentIndex, isHidden];

  CreateNewChannelStateInitial copyWith({
    int? currentIndex,
    bool? isHidden,
  }) {
    return CreateNewChannelStateInitial(
      currentIndex: currentIndex ?? this.currentIndex,
      isHidden: isHidden ?? this.isHidden,
    );
  }
}
