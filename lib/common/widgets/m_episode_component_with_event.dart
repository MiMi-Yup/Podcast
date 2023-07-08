import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:flutter/material.dart';
import 'package:join_podcast/common/widgets/m_add_to_playlist.dart';
import 'package:join_podcast/common/widgets/m_episode_component.dart';
import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/domain/use_cases/playlist_usecases.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/models/episode_model.dart';
import 'package:join_podcast/models/podcast_model.dart';
import 'package:join_podcast/models/response/podcasts/podcast_response.dart';
import 'package:join_podcast/presentation/detail_episode/detail_episode_route.dart';
import 'package:join_podcast/presentation/player/player_route.dart';
import 'package:join_podcast/utils/alert_util.dart';

class MEpisodeComponentWithEvent extends StatelessWidget {
  final EpisodeModel data;
  final bool isAdmin;
  final List<Widget> listOption;
  final void Function(int)? onMore;

  const MEpisodeComponentWithEvent(
      {super.key,
      required this.data,
      this.isAdmin = true,
      this.listOption = const [],
      this.onMore});

  @override
  Widget build(BuildContext context) {
    return MEpisodeComponent(
      title: data.name ?? '',
      author: data.podcast is Map
          ? PodcastModel.fromResponse(PodcastResponse.fromJson(data.podcast))
                  .author
                  ?.name ??
              ''
          : '',
      duration: Duration(seconds: data.duration?.toInt() ?? 0),
      networkImage: data.image,
      isCompleted: data.isListened ?? false,
      isPlayed: false,
      isDownloaded: false,
      onAvatarPressed: () => XMDRouter.pushNamed(routerIds[DetailEpisodeRoute]!,
          arguments: {'episode': data}),
      onPressed: () => XMDRouter.pushNamed(routerIds[PlayerRoute]!, arguments: {
        "id": data.id,
        "listEpisodes": [data],
      }),
      onPlay: (state) => !state,
      onDownload: (state) => !state,
      onMore: (index) {
        switch (index) {
          case 0:
            getIt<PlaylistUseCases>()
                .addEpisodeToFavourite(idEpisode: data.id!)
                .then((value) {
              if (value == true)
                AlertUtil.showToast(
                    MultiLanguage.of(context).addFavouriteSuccess);
            });
            break;
          case 1:
            showModalPlaylist(context, data.id!);
            break;
          default:
            if (onMore != null) onMore!(index);
            break;
        }
      },
      isAdmin: isAdmin,
      listOption: [
        Text(MultiLanguage.of(context).addToFavourite),
        Text(MultiLanguage.of(context).add_to_playlist),
        ...listOption
      ],
    );
  }
}
