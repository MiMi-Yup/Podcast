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
      onPressed: () => XMDRouter.pushNamed(routerIds[PlayerRoute]!, arguments: {
        "id": "6477572b97c18a4e7c630759",
        "listEpisodes": [
          EpisodeModel(
              id: "b1",
              image:
                  'https://cdn.pixabay.com/photo/2017/08/02/14/26/winter-landscape-2571788_1280.jpg',
              name: "Bai 1",
              href:
                  "https://www.learningcontainer.com/wp-content/uploads/2020/02/Sample-FLAC-File.flac"),
          EpisodeModel(
              id: "b2",
              image:
                  'https://cdn.pixabay.com/photo/2015/04/19/08/32/marguerite-729510_1280.jpg',
              name: "Bai 2",
              href:
                  "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba.mp3"),
          EpisodeModel(
              id: "b3",
              image:
                  'https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-980x653.jpg',
              name: "Bai 3",
              href:
                  "https://www.learningcontainer.com/wp-content/uploads/2020/02/Kalimba-online-audio-converter.com_-1.wav"),
        ],
      }),
      onPlay: (state) => !state,
      onDownload: (state) => !state,
      onMore: onMore,
      isAdmin: isAdmin,
      listOption: listOption,
    );
  }
}
