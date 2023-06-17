import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';
import 'package:join_podcast/models/playlist_model.dart';
import 'package:join_podcast/models/request/playlists/create_request.dart';

@injectable
class PlaylistUseCases {
  final UnitOfWork unitOfWork;

  PlaylistUseCases({required this.unitOfWork});

  Future<List<PlaylistModel>?> getAll() async {
    final result = await unitOfWork.playlist.getAllPlaylist();
    return result?.map((e) => PlaylistModel.fromResponse(e)).toList();
  }

  Future<PlaylistModel?> getFavourite() async {
    return null;
  }

  Future<PlaylistModel?> createPlaylist({required String name}) async {
    final result = await unitOfWork.playlist
        .createPlaylist(PlaylistCreateRequest(name: name));
    if (result == null) return null;
    return PlaylistModel.fromResponse(result);
  }

  Future<PlaylistModel?> getPlaylistById(String id) async {
    final result = await unitOfWork.playlist.getPlaylistById(id);
    if (result == null) return null;
    return PlaylistModel.fromResponse(result);
  }
}
