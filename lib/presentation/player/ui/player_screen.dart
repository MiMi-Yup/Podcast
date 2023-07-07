import 'package:flutter/material.dart';
import 'package:configuration/l10n/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/presentation/player/cubit/player_cubit.dart';
import 'package:join_podcast/presentation/player/ui/widgets/seekbar.dart';
import 'package:join_podcast/common/widgets/m_play_stop_button.dart';
import 'package:join_podcast/utils/alert_util.dart';
import 'package:just_audio/just_audio.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  @override
  Widget build(BuildContext context) {
    final playerCubit = BlocProvider.of<PlayerCubit>(context);
    return BlocBuilder<PlayerCubit, ExamplePlayerState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0.0,
            title: Text(
              state.episode?.name ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            actions: [
              PopupMenuButton<int>(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 0,
                    child: Row(
                      children: [
                        const Icon(Icons.speed),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(MultiLanguage.of(context).speed)
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 1,
                    child: Row(
                      children: [
                        const Icon(Icons.download),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(MultiLanguage.of(context).download)
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Row(
                      children: [
                        const Icon(Icons.playlist_add),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(MultiLanguage.of(context).add_to_playlist)
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 3,
                    child: Row(
                      children: [
                        const Icon(Icons.playlist_add),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(MultiLanguage.of(context).addToFavourite)
                      ],
                    ),
                  ),
                ],
                offset: const Offset(0, 50),
                onSelected: (value) {
                  switch (value) {
                    case 0:
                      playerCubit.showPlaybackSpeedModal(context);
                      break;
                    case 1:
                      break;
                    case 2:
                      playerCubit.showModalPlaylist(context);
                      break;
                    case 3:
                      playerCubit.addToFavourite().then((value) {
                        if (value)
                          AlertUtil.showToast(
                              MultiLanguage.of(context).addFavouriteSuccess);
                      });
                      break;
                    default:
                  }
                },
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Ảnh
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(40),
                    border: Border.all(color: Colors.grey.shade400),
                    color: Colors.grey,
                    image: DecorationImage(
                      image: NetworkImage(state.episode?.image ?? ''),
                      // image: NetworkImage("https://i.imgur.com/jO9KBQC.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                // Tên bài hát
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    state.episode?.name ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.w600),
                  ),
                ),
                // Tác giả
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    state.author ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                const Divider(
                  thickness: 1,
                  height: 5,
                ),
                StreamBuilder<SeekBarData>(
                  stream: playerCubit.seekBarDataStream,
                  builder: (context, snapshot) {
                    final positionData = snapshot.data;
                    return SeekBar(
                      position: positionData?.position ?? Duration.zero,
                      duration: positionData?.duration ?? Duration.zero,
                      onChangeEnd:
                          playerCubit.episodePlayerManager.audioPlayer.seek,
                    );
                  },
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      StreamBuilder<SequenceState?>(
                        stream: playerCubit.episodePlayerManager.audioPlayer
                            .sequenceStateStream,
                        builder: (context, index) {
                          return IconButton(
                            onPressed: playerCubit.episodePlayerManager
                                    .audioPlayer.hasPrevious
                                ? playerCubit.seekToPreviousEpisode
                                : null,
                            iconSize: 40,
                            icon: const Icon(Icons.skip_previous),
                          );
                        },
                      ),
                      GestureDetector(
                        onTap: () => playerCubit.skipBackward(),
                        child: const Icon(
                          Icons.replay_10,
                          size: 40,
                        ),
                      ),
                      PlayStopButton(
                        episodePlayerManager: playerCubit.episodePlayerManager,
                      ),
                      GestureDetector(
                        onTap: () => playerCubit.skipForward(),
                        child: const Icon(
                          Icons.forward_10,
                          size: 40,
                        ),
                      ),
                      StreamBuilder<SequenceState?>(
                        stream: playerCubit.episodePlayerManager.audioPlayer
                            .sequenceStateStream,
                        builder: (context, index) {
                          return IconButton(
                            onPressed: playerCubit
                                    .episodePlayerManager.audioPlayer.hasNext
                                ? playerCubit.seekToNextEpisode
                                : null,
                            iconSize: 40,
                            icon: const Icon(Icons.skip_next),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
