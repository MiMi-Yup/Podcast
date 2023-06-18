import 'dart:async';
import 'dart:io';

import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:join_podcast/presentation/record/record_page/record_page_route.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:path_provider/path_provider.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';

import '../../../../manifest.dart';
import '../../list_record/cubit/list_record_cubit.dart';
import '../../list_record/list_record.dart';
import '../../list_record/ui/list_record_screen.dart';
enum RecordingState { Record, Pause, Stop }

RecordingState recordingState = RecordingState.Record;

IconData getRecordingIcon() {
  switch (recordingState) {
    case RecordingState.Record:
      print("Recording");
      return Icons.mic;
    case RecordingState.Stop:
      print("Stop");
      return Icons.stop;
    // case RecordingState.Pause:
    //   print("Pause");
    //   return Icons.pause;
    default:
      return Icons.mic;
  }
}

final pathToSaveAudio = 'audio_temp.aac';

class SoundRecorder {
  FlutterSoundRecorder? _audioRecorder;
  bool _isRecorderInitialized = false;

  bool get isRecording => _audioRecorder!.isRecording;

  Future init() async {
    _audioRecorder = FlutterSoundRecorder();

    final status = await Permission.microphone.request();
    if (status != PermissionStatus.granted) {
      throw RecordingPermissionException('Microphone permission');
    }

    await _audioRecorder!.openRecorder();
    _isRecorderInitialized = true;
  }

  void dispose() {
    if (!_isRecorderInitialized) return;

    _audioRecorder!.closeRecorder();
    _audioRecorder = null;
    _isRecorderInitialized = false;
  }

  Future _record() async {
    if (!_isRecorderInitialized) return;

    await _audioRecorder!.startRecorder(toFile: pathToSaveAudio);
  }

  Future _stop() async {
    if (!_isRecorderInitialized) return;

    await _audioRecorder!.stopRecorder();
  }

  Future toggleRecording() async {
    if (_audioRecorder!.isStopped) {
      await _record();
    } else {
      await _stop();
    }
  }
}

class SoundPlayer {
  FlutterSoundPlayer? _audioPlayer;
  bool get isPlaying => _audioPlayer!.isPlaying;

  Future init() async {
    _audioPlayer = FlutterSoundPlayer();

    await _audioPlayer!.openPlayer();
  }

  void dispose() {
    _audioPlayer!.closePlayer();
    _audioPlayer = null;
  }

  Future _play(VoidCallback whenFinished) async {
    await _audioPlayer!.startPlayer(
      fromURI: pathToSaveAudio,
      whenFinished: whenFinished,
    );
  }

  Future _stop() async {
    await _audioPlayer!.stopPlayer();
  }

  Future togglePlaying({required VoidCallback whenFinished}) async {
    if (_audioPlayer!.isStopped) {
      await _play(whenFinished);
    } else {
      await _stop();
    }
  }
}

class RecordingPageScreen extends StatefulWidget {

  @override
  _RecordingScreenState createState() => _RecordingScreenState();
}

class _RecordingScreenState extends State<RecordingPageScreen> {
  bool isFirstTime = true;

  //Bo dem thoi gian ghi am
  Stopwatch stopwatch = Stopwatch();
  Timer? timer;

  //Ghi am và phat lai
  final recorder = SoundRecorder();
  final player = SoundPlayer();

  @override
  void initState() {
    super.initState();
    recorder.init();
    player.init();
  }

  void _showSaveDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        String userInput = '';

        return AlertDialog(
          // title: Text('Save Dialog'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  userInput = value;
                },
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () async {
                // Xử lý sự kiện khi nhấn nút Save trong Dialog mới
                print('User input: $userInput');
                final cacheDirectory = await getTemporaryDirectory();
                final pathTempCache = '${cacheDirectory.path}/audio_temp.aac';
                final directory = await getApplicationDocumentsDirectory();
                final destinationFolder = Directory('${directory.path}/my_folder');
                if (!await destinationFolder.exists()) {
                await destinationFolder.create();
                print('created my_folder');
                }

                final destinationPath = '${destinationFolder.path}/$userInput.aac';

                // Di chuyển file từ thư mục cache sang thư mục đích
                final sourceFile = File(pathTempCache);
               /*final destinationFile = */await sourceFile.copy(destinationPath);

                print('File saved to: $destinationPath');

                context.read<ListRecordCubit>().setShouldRefresh(true);
                print(context.read<ListRecordCubit>().state.shouldRefresh);
                Navigator.pop(dialogContext); // Đóng Dialog
                Future.delayed(Duration.zero, () {
                  Navigator.pop(context); // Đóng màn hình ghi âm
                });
              },
              child: Text('Save', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
            ),
          ],
        );
      },
    );
  }

  void startRecording() {
    stopwatch.start();
    timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {});
    });
  }

  void stopRecording() {
    stopwatch.stop();
    timer?.cancel();
}

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String hours = twoDigits(duration.inHours.remainder(60));
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$hours:$minutes:$seconds';
  }

  //Custom nut nghe thu
  Widget buildPlay() {
    var isPlaying = player.isPlaying;
    final icon = isPlaying ? Icons.stop : Icons.play_arrow;
    final text = isPlaying ? 'Stop Playing' : 'Play Recording';

    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(175, 50),
      ),
      icon: Icon(icon),
      label: Text(
          text,
        style: mST18M,
      ),
      onPressed: recorder.isRecording
          ? null // Nếu đang ghi âm, không thực hiện hành động khi nhấn nút
          : () async {
              await player.togglePlaying(whenFinished: () => setState(() {}));
              setState(() {});
            },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isRecording = recorder.isRecording;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            XMDRouter.pop();
          },
        ),
        centerTitle: true,
        title: Text(
          MultiLanguage.of(context).record,
          style: mST24R.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red,
                  ),
                ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: GestureDetector(
                        onTap: () async {
                            if (recordingState == RecordingState.Record) {
                              recordingState = RecordingState.Stop;
                              startRecording();
                              final isRecording = await recorder.toggleRecording();
                              isFirstTime = false;
                            // } else if (recordingState == RecordingState.Pause) {
                            //   recordingState = RecordingState.Stop;
                            //   startRecording();
                            } else {
                              recordingState = RecordingState.Pause;
                              stopRecording();
                              final isRecording = await recorder.toggleRecording();
                            }
                            setState(() {});
                        },
                        child: Icon(
                          getRecordingIcon(),
                          size: 48,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 40),
            Text(
              formatDuration(stopwatch.elapsed),
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 50),
            !isFirstTime ? buildPlay() : const SizedBox(height: 5),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  child: const Text('Edit'),
                  onPressed: () {
                    // Xử lý sự kiện khi nhấn nút Edit
                    setState(() {
                      recordingState = RecordingState.Record;
                      stopwatch.stop();
                      stopwatch.reset();
                      timer?.cancel();
                    });
                  },
                ),
                TextButton(
                  child: Text('Save'),
                  onPressed: () {
                    // Xử lý sự kiện khi nhấn nút Save
                    if (isFirstTime == true) {return;}
                    setState(() {
                      recordingState = RecordingState.Record;
                      stopwatch.stop();
                      stopwatch.reset();
                      timer?.cancel();
                    });
                    _showSaveDialog(context);
                  },
                ),
                TextButton(
                  child: Text('Delete'),
                  onPressed: () async {
                    // Xử lý sự kiện khi nhấn nút Delete
                    setState(() {
                      recordingState = RecordingState.Record;
                      stopwatch.stop();
                      stopwatch.reset();
                      timer?.cancel();
                    });
                    recorder._stop();
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


  @override
  void dispose() {
    stopwatch.stop();
    stopwatch.reset();
    timer?.cancel();
    recorder.dispose();
    player.dispose();
    super.dispose();
  }
}



