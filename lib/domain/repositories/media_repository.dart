import 'dart:async';
import 'dart:io';

import 'package:join_podcast/models/response/media/media_response.dart';

abstract class MediaRepository {
  FutureOr<MediaResponse?> uploadImage(File image);
  FutureOr<MediaResponse?> uploadAudio(File audio);
}
