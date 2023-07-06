import 'package:flutter/material.dart';
import 'package:configuration/l10n/l10n.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/presentation/episode/cubit/episode_cubit.dart';
import 'package:join_podcast/presentation/episode/ui/widgets/seekbar.dart';
import 'package:join_podcast/common/widgets/m_play_stop_button.dart';
import 'package:just_audio/just_audio.dart';

class EpisodeScreen extends StatefulWidget {
  const EpisodeScreen({Key? key}) : super(key: key);

  @override
  State<EpisodeScreen> createState() => _EpisodeScreenState();
}

class _EpisodeScreenState extends State<EpisodeScreen> {
  @override
  Widget build(BuildContext context) {
    final episodeCubit = BlocProvider.of<EpisodeCubit>(context);
    return BlocBuilder<EpisodeCubit, EpisodeState>(
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
                        const Icon(Icons.access_alarm),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(MultiLanguage.of(context).reminder)
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Row(
                      children: [
                        const Icon(Icons.share),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(MultiLanguage.of(context).share)
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 3,
                    child: Row(
                      children: const [
                        Icon(Icons.wifi),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text("View RSS feed")
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 4,
                    child: Row(
                      children: [
                        const Icon(Icons.report),
                        const SizedBox(
                          width: 10.0,
                        ),
                        Text(MultiLanguage.of(context).report)
                      ],
                    ),
                  ),
                ],
                offset: const Offset(0, 50),
                onSelected: (value) {
                  if (value == 0) {
                    episodeCubit.showPlaybackSpeedModal(context);
                  } else {
                    if (value == 1) {
                      episodeCubit.openReminder(context);
                    }
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
                    state.episode?.name ?? '',
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
                  stream: episodeCubit.seekBarDataStream,
                  builder: (context, snapshot) {
                    final positionData = snapshot.data;
                    return SeekBar(
                      position: positionData?.position ?? Duration.zero,
                      duration: positionData?.duration ?? Duration.zero,
                      onChangeEnd: state.audioPlayer.seek,
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
                        stream: state.audioPlayer.sequenceStateStream,
                        builder: (context, index) {
                          return IconButton(
                            onPressed: state.audioPlayer.hasPrevious
                                ? state.audioPlayer.seekToPrevious
                                : null,
                            iconSize: 40,
                            icon: const Icon(Icons.skip_previous),
                          );
                        },
                      ),
                      GestureDetector(
                        onTap: () => episodeCubit.skipBackward(),
                        child: const Icon(
                          Icons.replay_10,
                          size: 40,
                        ),
                      ),
                      PlayStopButton(audioPlayer: state.audioPlayer),
                      GestureDetector(
                        onTap: () => episodeCubit.skipForward(),
                        child: const Icon(
                          Icons.forward_10,
                          size: 40,
                        ),
                      ),
                      StreamBuilder<SequenceState?>(
                        stream: state.audioPlayer.sequenceStateStream,
                        builder: (context, index) {
                          return IconButton(
                            onPressed: state.audioPlayer.hasNext
                                ? state.audioPlayer.seekToNext
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
