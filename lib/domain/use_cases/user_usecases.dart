import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';
import 'package:join_podcast/models/request/users/create_channel_request.dart';
import 'package:join_podcast/models/request/users/update_request.dart';
import 'package:join_podcast/models/response/media/media_response.dart';
import 'package:join_podcast/models/response/users/user_response.dart';
import 'package:join_podcast/models/user_model.dart';

@injectable
class UserUseCases {
  final UnitOfWork unitOfWork;

  UserUseCases({required this.unitOfWork});

  Future<UserModel?> getPreviousState() async {
    if (unitOfWork.session.token != null &&
        unitOfWork.session.token?.isNotEmpty == true) {
      UserResponse? userResponse = await unitOfWork.user.getCurrentUser();
      if (userResponse != null) return userResponse.toModel();
    }
    return null;
  }

  Future<UserModel?> updateInfo(
      {String? avatar, DateTime? dob, String? name}) async {
    if (avatar != null) {
      final file = File(avatar);
      if (file.existsSync()) {
        MediaResponse? link = await unitOfWork.media.uploadImage(file);
        avatar = link?.url;
      }
    }
    UserResponse? newProfile = await unitOfWork.user.updateInfo(
        UserUpdateRequest(name: name, avatar: avatar, birthday: dob));
    return newProfile?.toModel();
  }

  Future<bool?> createChannel(
  {required String name}) async {
    return await unitOfWork.user.createChannel(CreateChannelRequest(name: name));
  }
}
