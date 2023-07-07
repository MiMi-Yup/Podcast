part of 'create_new_channel_cubit.dart';

// enum Status { initial, submitting, success, error }
class CreateNewChannelState extends Equatable {
  final String channelName;
  final String? avatar;
  final String initAvatar;
  // final Status state;
  // final bool signUp;
  // final bool isCreator;

  const CreateNewChannelState({
    required this.channelName,
    // required this.state,
    // this.signUp = false,
    this.initAvatar = 'https://cdn.pixabay.com/photo/2016/08/08/09/17/avatar-1577909_960_720.png',
    required this.avatar,
    });

  factory CreateNewChannelState.initial() {
    return CreateNewChannelState(
        channelName: '', avatar: null,);
  }

  @override
  bool? get stringify => true;

  @override
  List<Object?> get props =>
      [channelName, avatar];

  CreateNewChannelState copyWith({
    String? channelName,
  }) => CreateNewChannelState(
    channelName: channelName ?? this.channelName, avatar: avatar ?? this.avatar,
    );
}



