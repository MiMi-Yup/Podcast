import 'dart:async';
import 'dart:io';

import 'package:configuration/route/xmd_router.dart';
import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sound/public/flutter_sound_player.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/record/record_page/record_page_route.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:shared_preferences/shared_preferences.dart';

import '../cubit/list_record_cubit.dart';


Future<List<File>> getAudioFiles() async {
  final directory = await getApplicationDocumentsDirectory();
  final folderPath = '${directory.path}/my_folder';
  final folder = Directory(folderPath);
  final files = await folder.list().where((entity) => entity is File).map((file) => File(file.path)).toList();
  return files;
}

class ListRecordScreen extends StatefulWidget {
  const ListRecordScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ListRecordScreen> createState() => _ListRecordScreen();
}

class DottedRectanglePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final dashWidth = 4.0;
    final dashSpace = 2.0;

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);

    // Vẽ viền trên
    double startX = rect.left;
    while (startX < rect.right) {
      final endX = startX + dashWidth;
      canvas.drawLine(
        Offset(startX, rect.top),
        Offset(endX, rect.top),
        paint,
      );
      startX += dashWidth + dashSpace;
    }

    // Vẽ viền dưới
    startX = rect.left;
    while (startX < rect.right) {
      final endX = startX + dashWidth;
      canvas.drawLine(
        Offset(startX, rect.bottom),
        Offset(endX, rect.bottom),
        paint,
      );
      startX += dashWidth + dashSpace;
    }

    // Vẽ viền bên trái
    double startY = rect.top;
    while (startY < rect.bottom) {
      final endY = startY + dashWidth;
      canvas.drawLine(
        Offset(rect.left, startY),
        Offset(rect.left, endY),
        paint,
      );
      startY += dashWidth + dashSpace;
    }

    // Vẽ viền bên phải
    startY = rect.top;
    while (startY < rect.bottom) {
      final endY = startY + dashWidth;
      canvas.drawLine(
        Offset(rect.right, startY),
        Offset(rect.right, endY),
        paint,
      );
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class _ListRecordScreen extends State<ListRecordScreen> {
  List<File> listRecorded  = [];
  List<bool> isPlayingList = []; // Danh sách trạng thái phát âm thanh cho từng file
  int currentPlayingIndex = -1;
  //state
  bool isPlaying = false;
  FlutterSoundPlayer? _audioPlayer;
  bool get isPlaying2 => _audioPlayer!.isPlaying;

  Future init() async {
    _audioPlayer = FlutterSoundPlayer();

    await _audioPlayer!.openPlayer();
  }

  void disposeAudio() {
    _audioPlayer!.closePlayer();
    _audioPlayer = null;
  }

  Future _play(VoidCallback whenFinished, String path) async {
    await _audioPlayer!.startPlayer(
      fromURI: path,
      whenFinished: whenFinished,
    );
  }

  Future _stop() async {
    await _audioPlayer!.stopPlayer();
  }

  Future togglePlaying({required VoidCallback whenFinished, required String path}) async {
    if (_audioPlayer!.isStopped) {
      await _play(whenFinished, path);
    } else {
      await _stop();
    }
  }

  @override
  void initState() {
    super.initState();
    loadAudioFiles(); // Gọi phương thức để nạp danh sách file âm thanh
    init();
  }

  // Future<void> loadAudioFiles() async {
  //   final files = await getAudioFiles();
  //   setState(() {
  //     listRecorded = files;
  //     isPlayingList = List<bool>.filled(files.length, false); // Khởi tạo danh sách trạng thái ban đầu
  //   });
  // }
  Future<void> loadAudioFiles() async {
    final prefs = await SharedPreferences.getInstance();
    final files = prefs.getStringList('audioFiles');
    final reCheckList = await getAudioFiles();

    List<File> loadedFiles = [];
    if (files != null && files.length == reCheckList.length) {
      loadedFiles = files.map((path) => File(path)).toList();
    } else {
      // Thêm các thành phần mà reCheckList có mà files không có vào files
      if (files != null) {
        loadedFiles = files.map((path) => File(path)).toList();
        final existingPaths = files.toSet();
        final missingFiles = reCheckList.where((path) => !existingPaths.contains(path.path));
        loadedFiles.addAll(missingFiles.map((path) => File(path.path)));
      } else {
        loadedFiles = reCheckList;
      }
    }

    setState(() {
      listRecorded = loadedFiles;
      isPlayingList = List<bool>.filled(loadedFiles.length, false);
    });
  }

  Widget _list() {
    return ReorderableListView(
      onReorder: (oldIndex, newIndex) {
        setState(() {
          if (newIndex > oldIndex) {
            newIndex -= 1;
          }
          final recordedFile = listRecorded.removeAt(oldIndex);
          listRecorded.insert(newIndex, recordedFile);
        });
      },
      children: listRecorded.map((recordedFile) {
        final index = listRecorded.indexOf(recordedFile);
        return buildRecord(index, recordedFile);
      }).toList(),
    );
  }

  Widget buildRecord(int index, File recordedFile) {
    final fileName = path.basenameWithoutExtension(recordedFile.path);
    return Card(
      key: ValueKey(recordedFile.path),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.grey[200],
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        leading: Icon(Icons.density_large, color: Colors.black),
        title: Text(fileName),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: isPlayingList[index] ? Icon(Icons.stop, color: Colors.black) : Icon(Icons.play_arrow, color: Colors.black),
              onPressed: () => play(recordedFile, index),
            ),
            IconButton(
              icon: Icon(Icons.more_vert, color: Colors.black),
              onPressed: () => setting(index), // Hiển thị tùy chọn
            ),
          ],
        ),
      ),
    );
  }

  void remove(int index) async {
    final file = listRecorded[index];
    listRecorded.removeAt(index);
    await file.delete(); // Xóa file audio từ hệ thống tệp tin

    // Lưu danh sách lại sau khi xóa
    await saveAudioFiles();

    setState(() {
      // Nếu file đang phát được xóa, thì dừng phát
      if (currentPlayingIndex == index) {
        _stop();
        currentPlayingIndex = -1;
      }
    });
  }

  Future<void> saveAudioFiles() async {
    final prefs = await SharedPreferences.getInstance();
    final audioFileList = listRecorded.map((file) => file.path).toList();
    await prefs.setStringList('audioFiles', audioFileList);
  }


  Future<void> play(File recordedFile, int index) async {
    print(recordedFile);
    if (currentPlayingIndex == index && isPlayingList[index]) {
      // Bật/tắt phát âm thanh cho cùng một file
      setState(() {
        isPlayingList[index] = !isPlayingList[index];
      });
    } else {
      // Tắt phát âm thanh cho file đang phát hiện tại (nếu có)
      if (currentPlayingIndex >= 0 && currentPlayingIndex < isPlayingList.length) {
        setState(() {
          isPlayingList[currentPlayingIndex] = false;
        });
      }

      // Bật phát âm thanh cho file mới
      setState(() {
        currentPlayingIndex = index;
        isPlayingList[index] = true;
      });

      await togglePlaying(whenFinished: () {
        setState(() {
          isPlayingList[index] = false;
        });
      }, path: recordedFile.path);
    }
  }

  void showOptions(int index) {
    // Hiển thị tùy chọn cho file âm thanh tại vị trí index
  }

  void setting(int index) => showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 220,
          child:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(10.0),
                  decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color(
                      0xFF000000),width: 1.0),)),
                  child: Center(
                    child: Text(
                    'Audio options',
                    style: mST18M,
                ),
                  ),
              ),
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Edit audio'),
              ),
              ListTile(
                leading: Icon(Icons.music_note),
                title: Text('Add background music'),
              ),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text('Delete'),
                onTap: () => {
                  remove(index),
                  Navigator.pop(context)
                  },
              ),
            ],
          ),
        );
      });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListRecordCubit, ListRecordState>(
      builder: (context, state) {
        context.read<ListRecordCubit>().setShouldRefresh(true);
          if (state.shouldRefresh) {
            // Nếu giá trị bool được cập nhật, làm mới danh sách tại đây
            loadAudioFiles().then((_) {
              //context.read<ListRecordCubit>().setShouldRefresh(false);
              //print(context.read<ListRecordCubit>().state.shouldRefresh);
            });
          }
        // Hiển thị nội dung màn hình list_record_screen.dart
        return Padding(
          // recordpce (432:182)
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Studio",
                    style: mST32R.copyWith(fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              // Text(
              //   '00:00:00',
              //   textAlign: TextAlign.center,
              //   style: mST24R.copyWith(
              //       color: Colors.black, fontWeight: FontWeight.w500),
              // ),
              Container(
                  width: double.infinity,
                  height: 500,
                  decoration: listRecorded.isEmpty ? null : BoxDecoration(
                      border: Border.all()),
                  padding: EdgeInsets.all(10.0),
                  child: listRecorded.isEmpty ? CustomPaint(
                    painter: DottedRectanglePainter(),
                    child: const Center(
                      child: Text(
                        'Record or upload some audio, and it’ll appear here',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ) : _list()
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          // Xử lý sự kiện khi nhấn vào nút
                          //XMDRouter.pushNamed(routerIds[BackgroundMusicRoute]!);
                          // print(isFirstTime);
                          print(context.read<ListRecordCubit>().state.shouldRefresh);
                        },
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.green.shade500,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.music_note,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Music',
                        style: mST16R,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          //XMDRouter.pushNamed(routerIds[RecordPageRoute]!);
                          XMDRouter.pushNamedForResult(routerIds[RecordPageRoute]!);
                        },

                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            color: Colors.red.shade500,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.mic,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Record',
                        style: mST16R,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          // Xử lý sự kiện khi nhấn vào nút
                          // XMDRouter.pushNamed(routerIds[BackgroundMusicRoute]!);
                        },
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            color: Colors.purple.shade500,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.library_music,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Saved',
                        style: mST16R,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await loadAudioFiles();
  }

  @override
  void dispose() {
    disposeAudio();
    saveAudioFiles();
    super.dispose();
  }
}
