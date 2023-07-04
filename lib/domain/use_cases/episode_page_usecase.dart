import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';
import 'package:join_podcast/models/episode_model.dart';

@injectable
class EpisodeUseCases {
  final UnitOfWork unitOfWork;

  EpisodeUseCases({required this.unitOfWork});

  Future<EpisodeModel?> getPreviousState() async {
    if (unitOfWork.session.token != null &&
        unitOfWork.session.token?.isNotEmpty == true) {
      // ProfileResponse? userResponse = await unitOfWork.user.getCurrentUser();
      // if (userResponse != null) return userResponse.user;
    }
    return null;
  }
}
