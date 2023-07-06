import 'dart:async';
import 'dart:io';

import 'package:configuration/route/xmd_router.dart';
import 'package:configuration/style/style.dart';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit_config.dart';
import 'package:ffmpeg_kit_flutter/return_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sound/public/flutter_sound_player.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/record/record_page/record_page_route.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sn_progress_dialog/sn_progress_dialog.dart';

import '../../../channel/new_episode/createNewEpisode_route.dart';
import '../../background_music/background_music_details/background_music_detail_route.dart';
import '../cubit/list_record_cubit.dart';

Future<List<File>> getAudioFiles() async {
  final directory = await getApplicationDocumentsDirectory();
  final folderPath = '${directory.path}/my_folder';
  final folder = Directory(folderPath);
  final files = await folder.list().where((entity) => entity is File).map((file) => File(file.path)).toList();
  return files;
}

Future<String> getMergedPath() async {
  final directory = await getApplicationDocumentsDirectory();
  final folderPath = '${directory.path}/my_folder/merged';
  //final folder = Directory(folderPath);
  return folderPath;
}

Future<String> getAudioPath() async {
  final directory = await getApplicationDocumentsDirectory();
  final folderPath = '${directory.path}/my_folder';
  //final folder = Directory(folderPath);
  return folderPath;
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
  String mergePath = "";
  String audioPath = "";
  //Loading

  double progressValue = 0.0;
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
    loadMergedFolder();
    loadAudioFolder();
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

  Future<void> loadMergedFolder() async {
    final tempFolder = await getMergedPath();

    setState(() {
      mergePath = tempFolder;
    });
  }

  Future<void> loadAudioFolder() async {
    final tempFolder = await getAudioPath();

    setState(() {
      audioPath = tempFolder;
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

  Future<void> deleteAllAudioFiles(String directoryPath) async {
    // Tạo một đối tượng Directory từ đường dẫn thư mục
    final directory = Directory(directoryPath);

    // Kiểm tra xem thư mục có tồn tại không
    if (await directory.exists()) {
      // Lấy danh sách các file trong thư mục
      final fileList = await directory.list().toList();

      // Lặp qua từng file và xoá
      for (final file in fileList) {
        if (file is File && file.path.endsWith('.aac')) {
          await file.delete();
        }
      }
    }
    setState(() {
      listRecorded.clear();
    });
  }

  Future<void> copyFile(String sourcePath, String destinationPath) async {
    try {
      // Lấy đường dẫn thư mục nguồn
      print(sourcePath);
      Directory sourceDirectory = Directory(sourcePath);
      String sourceFileName = path.basename(sourcePath);

      // Lấy đường dẫn thư mục đích
      Directory destinationDirectory = await getApplicationDocumentsDirectory();
      String destinationFilePath = path.join(destinationDirectory.path, destinationPath, sourceFileName);

      print(sourceDirectory);
      // Kiểm tra xem tệp nguồn có tồn tại hay không
      if (await sourceDirectory.exists()) {
        // Tạo thư mục đích nếu nó chưa tồn tại
        await Directory(path.dirname(destinationFilePath)).create(recursive: true);

        // Sao chép tệp từ thư mục nguồn sang thư mục đích
        await File(sourcePath).copy(destinationFilePath);

        print('File copied successfully.');
      } else {
        print('Source file does not exist.');
      }
    } catch (e) {
      print('Error while copying file: $e');
    }
  }

  Future<void> moveAACFile(String sourcePath, String destinationPath) async {
    try {
      // Kiểm tra xem tệp nguồn có tồn tại không
      final sourceFile = File(sourcePath);
      if (!await sourceFile.exists()) {
        print('Source file does not exist.');
        return;
      }

      // Kiểm tra xem tệp đích đã tồn tại không
      final destinationFile = File(destinationPath);
      if (await destinationFile.exists()) {
        print('Destination file already exists. Remove the file or choose a different destination.');
        return;
      }

      // Di chuyển tệp
      await sourceFile.rename(destinationPath);

      print('File moved successfully.');
    } catch (e) {
      print('Failed to move file: $e');
    }
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
    return Scaffold(
    body: BlocBuilder<ListRecordCubit, ListRecordState>(
      builder: (context, state) {
        context.read<ListRecordCubit>().setShouldRefresh(true);
          if (state.shouldRefresh) {
            // Nếu giá trị bool được cập nhật, làm mới danh sách tại đây
            loadAudioFiles().then((_) {
              context.read<ListRecordCubit>().setShouldRefresh(true);
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
              Stack(
                alignment: Alignment.centerRight,
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
                  listRecorded.isNotEmpty ?
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.teal),
                    ),
                    onPressed: () {
                      // Xử lý sự kiện khi nhấn nút Save
                      XMDRouter.pushNamed(routerIds[CreateNewEpisodeRoute]!);
                    },
                    child: Text('Save'),
                  ) : Container(),
                ]
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
              listRecorded.length>1 ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        // Xử lý sự kiện khi nhấn nút Play Preview
                        loadAudioFolder();
                        await deleteAllAudioFiles(audioPath);
                      },
                      child: Row( children: [Text('Play Preview'), Icon(Icons.play_arrow_outlined)])
                    ),

                    ElevatedButton(
                      onPressed: () async {
                        // Xử lý sự kiện khi nhấn nút Merge
                        loadMergedFolder();
                        loadAudioFolder();
                        bool mergeSuccess = false;
                        if (mergePath != '') {
                          print(mergePath);
                            await mergeAudioFiles2(
                                listRecorded
                                    .map((file) => file.path)
                                    .toList(),
                                mergePath);
                        }else {
                          print("failed");
                        }
                            },
                      child: Row( children: [Text('Merge'), Icon(Icons.merge)])
                    ),
                  ],
                )
               :
                Container(), // Hiển thị một container trống nếu danh sách rỗng
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      InkWell(
                        onTap: () {
                          // Xử lý sự kiện khi nhấn vào nút
                          XMDRouter.pushNamed(routerIds[BackgroundMusicDetailRoute]!);
                          // print(isFirstTime);
                          //print(context.read<ListRecordCubit>().state.shouldRefresh);
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
    )
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

  Future<void> mergeAudioFiles2(List<String> audioFiles, String outputPath) async {
    // Thiết lập cấu hình cho FFmpegKit
    FFmpegKitConfig.enableStatisticsCallback();
    FFmpegKitConfig.enableLogCallback();
    String outputFileName = "${DateTime.now().year}.${DateTime.now().month}.${DateTime.now().day}.${DateTime.now().hour}.${DateTime.now().minute}.${DateTime.now().second}";
    ProgressDialog pd;
    pd = ProgressDialog(context: context);
    pd.show(max: 100, msg: 'Merging audio files...');
    // Xây dựng danh sách các tệp đầu vào
    String inputFiles = "";
    for (String audioFile in audioFiles) {
      inputFiles += "-i '$audioFile' ";
    }

    // Tạo lệnh để merge các tệp âm thanh
    String command = "$inputFiles -filter_complex concat=n=${audioFiles.length}:v=0:a=1[outa] -map [outa] '$outputPath'/$outputFileName.aac";


    // Thực thi lệnh merge bằng FFmpegKit
    await FFmpegKit.execute(command).then((session) async {
      final returnCode = await session.getReturnCode();
      if (ReturnCode.isSuccess(returnCode)) {

        pd.close();
        print('Merge audio files successful.' '$outputPath/$outputFileName.aac');
      } else if (ReturnCode.isCancel(returnCode)) {
        pd.close();
        print('Merge audio files failed. Return code: $returnCode');
      }
    });
    await deleteAllAudioFiles(audioPath);
    //await Future.delayed(Duration(seconds: 1));
    await moveAACFile('$outputPath/$outputFileName.aac', '$audioPath/$outputFileName.aac');
    await loadAudioFiles();
  }
}
