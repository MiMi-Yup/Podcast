import 'dart:async';

import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'dart:async';

import '../../../../manifest.dart';
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
    case RecordingState.Pause:
      print("Pause");
      return Icons.pause;
    default:
      return Icons.mic;
  }
}

class RecordingPageScreen extends StatefulWidget {
  @override
  _RecordingScreenState createState() => _RecordingScreenState();
}

class _RecordingScreenState extends State<RecordingPageScreen> {
  bool isRecording = false;
  Stopwatch stopwatch = Stopwatch();
  Timer? timer;

  void _navigateToRecordList() {
    Navigator.push(
      context,
        XMDRouter.pushNamed(routerIds[ListRecordPage]!),
    );
  }

  void _showSaveDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
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
              onPressed: () {
                // Xử lý sự kiện khi nhấn nút Save trong Dialog mới
                print('User input: $userInput');
                Navigator.pop(context); // Đóng Dialog mới
                _navigateToRecordList(); // Chuyển đến màn hình danh sách
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
    showDialog(
      context: context,
      builder: (BuildContext context)
    {
      return AlertDialog(
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
              child: const Text('Edit'),
              onPressed: () {
                setState(() {
                  recordingState = RecordingState.Record;
                  stopwatch.stop();
                  stopwatch.reset();
                  timer?.cancel();
                });
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('Save'),

              onPressed: () {
                setState(() {
                  recordingState = RecordingState.Record;
                  stopwatch.stop();
                  stopwatch.reset();
                  timer?.cancel();
                });
                Navigator.pop(context);
                _showSaveDialog(context);
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                setState(() {
                  recordingState = RecordingState.Record;
                  stopwatch.stop();
                  stopwatch.reset();
                  timer?.cancel();
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ]
    );
  },
);
}

  String formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String hours = twoDigits(duration.inHours.remainder(60));
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$hours:$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
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
                        onTap: () {
                          setState(() {
                            if (recordingState == RecordingState.Record) {
                              recordingState = RecordingState.Stop;
                              startRecording();
                            } else if (recordingState == RecordingState.Pause) {
                              recordingState = RecordingState.Stop;
                              startRecording();
                            } else {
                              recordingState = RecordingState.Pause;
                              stopRecording();
                            }
                          });
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
    super.dispose();
  }
}



