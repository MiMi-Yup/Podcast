import 'package:flutter/material.dart';
import 'package:configuration/l10n/l10n.dart';
import 'package:join_podcast/presentation/podcast/ui/widgets/seekbar.dart';
import 'package:join_podcast/common/widgets/m_play_stop_button.dart';
// import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart' as rxdart;
import '../../../models/model_example/podcast_model.dart';

class PodcastScreen extends StatefulWidget {
  const PodcastScreen({Key? key}) : super(key: key);

  @override
  State<PodcastScreen> createState() => _PodcastScreenState();
}

class _PodcastScreenState extends State<PodcastScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  Song song = Get.arguments ?? Song.songs[1];

  @override
  void initState() {
    super.initState();
    audioPlayer.setAudioSource(
      ConcatenatingAudioSource(
        children: [
          AudioSource.uri(
            Uri.parse('asset:///${song.url}'),
          ),
        ],
      ),
    );
    // () async {
    //   await audioPlayer.setUrl(
    //       "https://res.cloudinary.com/psncloud/video/upload/v1685551354/sample4_k2de2y.aac?fbclid=IwAR1QYG7Y5Tptvsb-3Z45B5nOkNO47jPSVdxji7QeduW1jYk1KATmBJJRlps");
    // };
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

  Stream<SeekBarData> get _seekBarDataStream =>
      rxdart.Rx.combineLatest2<Duration, Duration?, SeekBarData>(
          audioPlayer.positionStream, audioPlayer.durationStream, (
        Duration position,
        Duration? duration,
      ) {
        return SeekBarData(
          position,
          duration ?? Duration.zero,
        );
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          song.title,
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
                value: 2,
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
                value: 2,
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
                value: 0,
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
              const PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    Icon(Icons.wifi),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text("View RSS feed")
                  ],
                ),
              ),
              PopupMenuItem(
                value: 2,
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
            onSelected: null,
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
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://go.yolo.vn/wp-content/uploads/2019/08/hinh-anh-cho-pomsky-dep-45.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Tên bài hát
            Align(
              alignment: Alignment.center,
              child: Text(
                song.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ),
            // Tác giả
            Align(
              alignment: Alignment.center,
              child: Text(
                song.description,
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
              stream: _seekBarDataStream,
              builder: (context, snapshot) {
                final positionData = snapshot.data;
                return SeekBar(
                  position: positionData?.position ?? Duration.zero,
                  duration: positionData?.duration ?? Duration.zero,
                  onChangeEnd: audioPlayer.seek,
                );
              },
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  StreamBuilder<SequenceState?>(
                    stream: audioPlayer.sequenceStateStream,
                    builder: (context, index) {
                      return IconButton(
                        onPressed: audioPlayer.hasPrevious
                            ? audioPlayer.seekToPrevious
                            : null,
                        iconSize: 40,
                        icon: const Icon(Icons.skip_previous),
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.replay_10,
                      size: 40,
                    ),
                    onPressed: () {},
                  ),
                  PlayStopButton(audioPlayer: audioPlayer),
                  IconButton(
                    icon: const Icon(
                      Icons.forward_10,
                      size: 40,
                    ),
                    onPressed: () {},
                  ),
                  StreamBuilder<SequenceState?>(
                    stream: audioPlayer.sequenceStateStream,
                    builder: (context, index) {
                      return IconButton(
                        onPressed:
                            audioPlayer.hasNext ? audioPlayer.seekToNext : null,
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
  }
}
