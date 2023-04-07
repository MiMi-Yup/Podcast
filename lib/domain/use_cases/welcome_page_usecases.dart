import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';
import 'package:join_podcast/models/request/login_user_request.dart';
import 'package:join_podcast/models/request/new_user_request.dart';
import 'package:join_podcast/models/response/get_user_response.dart';
import 'package:join_podcast/models/response/login_user_response.dart';
import 'package:join_podcast/models/user_model.dart';

@injectable
class WelcomeUseCases {
  final UnitOfWork unitOfWork;

  WelcomeUseCases({required this.unitOfWork});

  Future<UserModel?> getPreviousState() async {
    // GetUserResponse userResponse = await unitOfWork.user.getCurrentUser();
    return null;
  }
}
