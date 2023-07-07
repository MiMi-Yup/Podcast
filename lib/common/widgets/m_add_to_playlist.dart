import 'package:flutter/material.dart';
import 'package:join_podcast/common/widgets/m_text_field_bottom_modal.dart';
import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/domain/use_cases/playlist_usecases.dart';
import 'package:join_podcast/presentation/player/ui/widgets/custom_modal_bottom_sheet.dart';
import 'package:get/get.dart';

void showModalPlaylist(BuildContext context, String idEpisode) async {
  final usecase = getIt<PlaylistUseCases>();
  final playlists = await usecase.getAll();
  final result = await showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
      top: Radius.circular(20),
    )),
    builder: (context) {
      return CustomModalBottomSheet(
        onCreatePlaylist: () async {
          final _controller = TextEditingController();
          final result = await showTextFieldBottomModal(
            Get.context!,
            "New Playlist",
            _controller,
          );
          if (result != null && result.isNotEmpty) {
            final playlist = await usecase.createPlaylist(name: result);
            if (playlist?.id != null) {
              usecase.addEpisodeToPlaylist(
                  idPlaylist: playlist!.id!, idEpisode: idEpisode);
            }
            return true;
          }
          return false;
        },
        listTitle: playlists?.map((e) => e.name ?? '').toList(),
      );
    },
  );
  if (result != null && result is List<bool>) {
    final addToPlaylist = (result as List<bool>)
        .asMap()
        .entries
        .where((element) => element.value)
        .map((e) => playlists?[e.key]);
    for (var element in addToPlaylist) {
      usecase.addEpisodeToPlaylist(
          idPlaylist: element!.id!, idEpisode: idEpisode);
    }
  }
}
