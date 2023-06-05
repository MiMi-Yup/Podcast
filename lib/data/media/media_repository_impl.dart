import 'dart:io';

import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:join_podcast/data/data_source/remote/media_service.dart';
import 'package:join_podcast/domain/repositories/media_repository.dart';
import 'package:join_podcast/models/response/media/media_response.dart';
import 'package:join_podcast/utils/exception_util.dart';
import 'package:path/path.dart' as p;

@Injectable(as: MediaRepository)
class MediaRepositoryImpl implements MediaRepository {
  MediaRepositoryImpl({required this.service});

  final MediaService? service;

  final _acceptAudio = ['.aac'];
  bool checkAudioContentType(String extension) =>
      _acceptAudio.contains(extension);

  @override
  FutureOr<MediaResponse?> uploadAudio(File audio) {
    if (!checkImageContentType(p.extension(audio.path))) {
      ExceptionUtil.handle(Exception('No support file'));
      return null;
    }
    return service
        ?.uploadAudio(audio)
        .then((value) => value.data)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return null;
    });
  }

  final _acceptImage = ['.jpg', '.jpeg', '.png'];
  bool checkImageContentType(String extension) =>
      _acceptImage.contains(extension);

  @override
  FutureOr<MediaResponse?> uploadImage(File image) {
    if (!checkImageContentType(p.extension(image.path))) {
      ExceptionUtil.handle(Exception('No support file'));
      return null;
    }
    return service
        ?.uploadImage(image)
        .then((value) => value.data)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return null;
    });
  }
}
