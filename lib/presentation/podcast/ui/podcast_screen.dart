import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';
import 'package:configuration/l10n/l10n.dart';
import 'package:join_podcast/presentation/podcast/ui/widgets/seekbar.dart';
import 'package:join_podcast/common/widgets/m_play_stop_button.dart';
import 'package:get/get.dart';
import 'package:join_podcast/presentation/podcast/ui/widgets/speed_bottom_modal_sheet.dart';
import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart' as rxdart;
import '../../../models/model_example/podcast_model.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class PodcastScreen extends StatefulWidget {
  const PodcastScreen({Key? key}) : super(key: key);

  @override
  State<PodcastScreen> createState() => _PodcastScreenState();
}

class _PodcastScreenState extends State<PodcastScreen> {
  AudioPlayer audioPlayer = AudioPlayer();
  late double selectedSpeed;
  DateTime? selectedTime;
  Song song = Get.arguments ?? Song.songs[0];
// Tua tiếp 10s
  void skipForward() {
    audioPlayer.seek(audioPlayer.position + const Duration(seconds: 10));
  }

// Tua về trước 10s
  void skipBackward() {
    audioPlayer.seek(audioPlayer.position > const Duration(seconds: 10)
        ? audioPlayer.position - const Duration(seconds: 10)
        : Duration.zero);
  }

  @override
  void initState() {
    super.initState();
    updateSelectedSpeed(1);
    // audioPlayer.setAsset(song.url);
    audioPlayer.setUrl(
        "https://res.cloudinary.com/psncloud/video/upload/v1685551354/sample4_k2de2y.aac?fbclid=IwAR1QYG7Y5Tptvsb-3Z45B5nOkNO47jPSVdxji7QeduW1jYk1KATmBJJRlps");
    audioPlayer.play();
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
// Cập nhật tốc độ phát
  void updateSelectedSpeed(double speed) {
    setState(() {
      selectedSpeed = speed;
      audioPlayer.setSpeed(selectedSpeed);
    });
  }

// Hiển thị ModalBottomSheet điều chỉnh tốc độ
  void showPlaybackSpeedModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return SpeedChange(
            speed: selectedSpeed,
            onSpeedChanged: updateSelectedSpeed,
          );
        });
  }

// Hiển thị lời nhắc nhở
  Future<DateTime?> pickDateTime(DateTime? selectedDateTime) async {
    DateTime? date = await pickDate(selectedDateTime);
    if (date == null) return null;
    TimeOfDay? time = await pickTime(selectedDateTime);
    if (time == null) return null;

    return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  }

  Future<DateTime?> pickDate(DateTime? selectedDateTime) => showDatePicker(
      context: context,
      initialDate: selectedDateTime!,
      firstDate: DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, DateTime.now().hour, DateTime.now().minute),
      lastDate: DateTime(DateTime.now().year + 100));
  Future<TimeOfDay?> pickTime(DateTime? selectedDateTime) => showTimePicker(
        context: context,
        initialTime: TimeOfDay(
            hour: selectedDateTime!.hour, minute: selectedDateTime.minute),
      );
  void openReminder(BuildContext context) {
    DateTime? selectedDateTime = selectedTime ?? DateTime.now();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(16.0),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Đặt lời nhắc',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Nhắc tôi nghe Podcast này vào lúc:',
                  ),
                  const SizedBox(height: 16.0),
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color?>(
                      (states) => mCGreen500,
                    )),
                    onPressed: () async {
                      DateTime? pickedDate =
                          await pickDateTime(selectedDateTime);
                      if (pickedDate != null) {
                        setState(() {
                          selectedDateTime = pickedDate;
                        });
                      }
                    },
                    child: Text(
                        '${selectedDateTime!.hour.toString().padLeft(2, '0')}:${selectedDateTime!.minute.toString().padLeft(2, '0')} - ${selectedDateTime!.day.toString().padLeft(2, '0')}/${selectedDateTime!.month.toString().padLeft(2, '0')}/${selectedDateTime!.year.toString().padLeft(4, '0')}'),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancel'),
                      ),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          // Thực hiện logic để hiển thị thông báo tại thời gian đã chọn
                          // và xử lý xóa ngày giờ hẹn nếu cần
                          selectedTime = selectedDateTime;
                          Navigator.pop(context);
                        },
                        child: const Text('Ok'),
                      ),
                    ],
                  )
                ],
              );
            },
          ),
        );
      },
    );
  }

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
                showPlaybackSpeedModal(context);
              } else {
                if (value == 1) {
                  openReminder(context);
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
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://go.yolo.vn/wp-content/uploads/2019/08/hinh-anh-cho-pomsky-dep-45.jpg"),
                  // image: NetworkImage("https://i.imgur.com/jO9KBQC.jpg"),
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
            ActionBar(),
          ],
        ),
      ),
    );
  }

  Container ActionBar() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StreamBuilder<SequenceState?>(
            stream: audioPlayer.sequenceStateStream,
            builder: (context, index) {
              return IconButton(
                onPressed:
                    audioPlayer.hasPrevious ? audioPlayer.seekToPrevious : null,
                iconSize: 40,
                icon: const Icon(Icons.skip_previous),
              );
            },
          ),
          GestureDetector(
            onTap: skipBackward,
            child: const Icon(
              Icons.replay_10,
              size: 40,
            ),
          ),
          PlayStopButton(audioPlayer: audioPlayer),
          GestureDetector(
            onTap: skipForward,
            child: const Icon(
              Icons.forward_10,
              size: 40,
            ),
          ),
          StreamBuilder<SequenceState?>(
            stream: audioPlayer.sequenceStateStream,
            builder: (context, index) {
              return IconButton(
                onPressed: audioPlayer.hasNext ? audioPlayer.seekToNext : null,
                iconSize: 40,
                icon: const Icon(Icons.skip_next),
              );
            },
          ),
        ],
      ),
    );
  }
}
