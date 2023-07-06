import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';
import 'package:join_podcast/models/request/auth/login_user_request.dart';
import 'package:join_podcast/models/request/auth/new_user_request.dart';
import 'package:join_podcast/models/request/auth/reset_user_request.dart';
import 'package:join_podcast/models/request/auth/verify_user_request.dart';
import 'package:join_podcast/models/request/channel/create_channel_request.dart';
import 'package:join_podcast/models/response/auth/login_user_response.dart';
import 'package:join_podcast/models/user_model.dart';

@injectable
class ChannelUseCases {
  final UnitOfWork unitOfWork;

  ChannelUseCases({required this.unitOfWork});

  Future<bool?> createChannel(
      {required String name}) async {
    //for test
    //return new UserModel(id: 1, name: 'Admin', email: 'admin@gmail.com');
    // end for test
    return unitOfWork.channel.createChannel(ChannelCreateRequest(
        name: name));
  }

}
