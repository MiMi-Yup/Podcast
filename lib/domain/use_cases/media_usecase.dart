import 'package:injectable/injectable.dart';

import '../repositories/unit_of_work.dart';

@injectable
class MediaUseCases {
  final UnitOfWork unitOfWork;

  MediaUseCases({required this.unitOfWork});


}