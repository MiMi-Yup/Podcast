import 'package:configuration/route/xmd_router.dart';
import 'package:flutter/material.dart';
import 'package:join_podcast/common/widgets/m_episode_component.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/models/episode_model.dart';
import 'package:join_podcast/models/podcast_model.dart';
import 'package:join_podcast/models/response/podcasts/podcast_response.dart';
import 'package:join_podcast/presentation/detail_episode/detail_episode_route.dart';
import 'package:join_podcast/presentation/player/player_route.dart';

class MEpisodeComponentWithEvent extends StatelessWidget {
  final EpisodeModel data;
  final bool isAdmin;
  final List<Widget> listOption;
  final void Function(int)? onMore;

  const MEpisodeComponentWithEvent(
      {super.key,
      required this.data,
      this.isAdmin = false,
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
      onAvatarPressed: () =>
          XMDRouter.pushNamed(routerIds[DetailEpisodeRoute]!),
      onPressed: () => XMDRouter.pushNamed(routerIds[PlayerRoute]!),
      onPlay: (state) => !state,
      onDownload: (state) => !state,
      onMore: onMore,
      isAdmin: isAdmin,
      listOption: listOption,
    );
  }
}
