import 'package:flutter/material.dart';
import 'package:configuration/l10n/l10n.dart';
import 'package:join_podcast/presentation/podcast/ui/widgets/seekbar.dart';
import 'package:join_podcast/common/widgets/m_play_stop_button.dart';
import 'package:audioplayers/audioplayers.dart';

class PodcastScreen extends StatefulWidget {
  final int ordinalNumber;
  final String title;
  final String author;
  final String? networkImage;
  final ValueChanged<Duration>? onChanged;
  final ValueChanged<Duration>? onChangeEnd;
  const PodcastScreen(
      {Key? key,
      this.onChanged,
      this.onChangeEnd,
      required this.ordinalNumber,
      required this.title,
      required this.author,
      required this.networkImage})
      : super(key: key);

  @override
  State<PodcastScreen> createState() => _PodcastScreen();
}

class _PodcastScreen extends State<PodcastScreen> {
  AudioPlayer player = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();
    () async {
      player.setSourceAsset('../../../assets/audio/134_-_The_Onead9d4.mp3');
    };
    // () async {
    //   ByteData data =
    //       await rootBundle.load('../../../assets/audio/134_-_The_Onead9d4.mp3');
    //   Uint8List bytes = data.buffer.asUint8List();
    //   String absolutePath = Uri.dataFromString(bytes.toString()).toString();
    //   () async {
    //     player.setSourceUrl(absolutePath);
    //   };
    // };
    player.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });
    player.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });
    player.onPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          widget.author,
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
              PopupMenuItem(
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
            Align(
              alignment: Alignment.center,
              child: Text(
                widget.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                widget.author,
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
            // ignore: avoid_unnecessary_containers
            Container(
              child: SeekBar(
                position: position,
                duration: duration,
                onChanged: (value) {
                  player.seek(position);
                  player.resume();
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.skip_previous,
                      size: 40,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.replay_10,
                      size: 40,
                    ),
                    onPressed: () {},
                  ),
                  PlayStopButton(),
                  IconButton(
                    icon: const Icon(
                      Icons.forward_10,
                      size: 40,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.skip_next,
                      size: 40,
                    ),
                    onPressed: () {},
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
