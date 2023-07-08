import 'package:injectable/injectable.dart';
import 'package:join_podcast/domain/repositories/unit_of_work.dart';
import 'package:join_podcast/models/episode_model.dart';
import 'package:join_podcast/models/playlist_model.dart';
import 'package:join_podcast/models/request/playlists/create_request.dart';

@injectable
class PlaylistUseCases {
  final UnitOfWork unitOfWork;

  PlaylistUseCases({required this.unitOfWork});

  Future<List<PlaylistModel>?> getAll() async {
    final result = await unitOfWork.playlist.getAllPlaylist();
    return result == null || result.items == null || result.count == 0
        ? []
        : result.items?.map((e) => PlaylistModel.fromResponse(e)).toList();
  }

  Future<List<EpisodeModel>?> getFavourite() async {
    final result = await unitOfWork.user.getFavouriteEpisodes();
    return result == null || result.count == 0 || result.items == null
        ? []
        : result.items?.map((e) => EpisodeModel.fromJson(e.toJson())).toList();
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

  Future<bool> deletePlaylist({required String id}) async {
    final result = await unitOfWork.playlist.deletePlaylist(id);
    return result ?? false;
  }

  Future<bool> removeFromPlaylist(
      {required String idPlaylist, required String idEpisode}) async {
    final result = await unitOfWork.playlist.removeEpisodeFromPlaylist(
        idPlaylist: idPlaylist, idEpisode: idEpisode);
    return result ?? false;
  }

  Future<bool> updatePlaylist(
      {required String idPlaylist, String? name}) async {
    if (name != null && name.isNotEmpty) {
      return await unitOfWork.playlist
              .updatePlaylist(idPlaylist: idPlaylist, name: name) ??
          false;
    }
    return false;
  }

  Future<bool?> addEpisodeToPlaylist(
      {required String idPlaylist, required String idEpisode}) async {
    return unitOfWork.playlist.addEpisodeToPlaylist(
            idPlaylist: idPlaylist, idEpisode: idEpisode) ??
        false;
  }

  Future<bool?> addEpisodeToFavourite({required String idEpisode}) {
    return unitOfWork.user.addIntoFavourite(idEpisode);
  }

  Future<bool?> removeFavourite(EpisodeModel episode) {
    return unitOfWork.user.removeEpisodeInFavourite(episode.id!);
  }
}
