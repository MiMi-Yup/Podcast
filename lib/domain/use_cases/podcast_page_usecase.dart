import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';

@injectable
class PodcastUseCases {
  final UnitOfWork unitOfWork;

  PodcastUseCases({required this.unitOfWork});
}
