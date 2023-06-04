import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';
import 'package:join_podcast/models/response/users/profile_response.dart';
import 'package:join_podcast/models/user_model.dart';

@injectable
class UserUseCases {
  final UnitOfWork unitOfWork;

  UserUseCases({required this.unitOfWork});

  Future<UserModel?> getPreviousState() async {
    if (unitOfWork.session.token != null &&
        unitOfWork.session.token?.isNotEmpty == true) {
      ProfileResponse? userResponse = await unitOfWork.user.getCurrentUser();
      if (userResponse != null) return userResponse.user;
    }
    return null;
  }
}
