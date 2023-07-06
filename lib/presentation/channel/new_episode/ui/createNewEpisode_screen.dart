import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:configuration/style/style.dart';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit_config.dart';
import 'package:ffmpeg_kit_flutter/return_code.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sound/public/flutter_sound_player.dart';
import 'package:image_picker/image_picker.dart';
import 'package:join_podcast/presentation/channel/new_episode/cubit/createNewEpisode_cubit.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';

class CreateNewEpisodeScreen extends StatefulWidget {
  const CreateNewEpisodeScreen({super.key});
  @override
  _PodcastEditingScreenState createState() => _PodcastEditingScreenState();
}

Future<List<File>> getAudioFiles() async {
  final directory = await getApplicationDocumentsDirectory();
  final folderPath = '${directory.path}/my_folder';
  final folder = Directory(folderPath);
  // Kiểm tra xem thư mục "my_folder" đã tồn tại hay chưa
  if (!await folder.exists()) {
    // Nếu thư mục chưa tồn tại, tạo thư mục
    await folder.create(recursive: true);
    print('Created folder: ${folder.path}');
  } else {
    print('Folder already exists: ${folder.path}');
  }
  final files = await folder.list().where((entity) => entity is File).map((file) => File(file.path)).toList();
  return files;
}

  class _PodcastEditingScreenState extends State<CreateNewEpisodeScreen> {

    List<File> listRecorded  = [];
    File? _image;
    final ImagePicker _picker = ImagePicker();
    String mergePath = "";
    String audioPath = "";

    final TextEditingController _podcastName = TextEditingController();
    final TextEditingController _podcastNameTag = TextEditingController();
    final TextEditingController _podcastDescription = TextEditingController();



    Future<void> _getImageFromGallery() async {
      final pickedImage = await ImagePicker().pickImage(
          source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          _image = File(pickedImage.path);
        });
      }
    }

    Future<void> _getImageFromCamera() async {
      final pickedImage = await ImagePicker().pickImage(
          source: ImageSource.camera);
      if (pickedImage != null) {
        setState(() {
          _image = File(pickedImage.path);
        });
      }
    }

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
          final missingFiles = reCheckList.where((path) =>
          !existingPaths.contains(path.path));
          loadedFiles.addAll(missingFiles.map((path) => File(path.path)));
        } else {
          loadedFiles = reCheckList;
        }
      }

      setState(() {
        listRecorded = loadedFiles;
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

    Future<String> getMergedPath() async {
      final directory = await getApplicationDocumentsDirectory();
      final folderPath = '${directory.path}/my_folder/merged';
      final folder = Directory(folderPath);
      // Kiểm tra xem thư mục "merged" đã tồn tại hay chưa
      if (!await folder.exists()) {
        // Nếu thư mục chưa tồn tại, tạo thư mục
        await folder.create(recursive: true);
        print('Created folder: ${folder.path}');
      } else {
        print('Folder already exists: ${folder.path}');
      }
      return folder.path;
    }

    Future<void> loadMergedFolder() async {
      final tempFolder = await getMergedPath();

      setState(() {
        mergePath = tempFolder;
      });
    }

    Future<String> getAudioPath() async {
      final directory = await getApplicationDocumentsDirectory();
      final folderPath = '${directory.path}/my_folder';
      final folder = Directory(folderPath);
      // Kiểm tra xem thư mục "merged" đã tồn tại hay chưa
      if (!await folder.exists()) {
        // Nếu thư mục chưa tồn tại, tạo thư mục
        await folder.create(recursive: true);
        print('Created folder: ${folder.path}');
      } else {
        print('Folder already exists: ${folder.path}');
      }
      return folder.path;
    }

    Future<void> loadAudioFolder() async {
      final tempFolder = await getAudioPath();

      setState(() {
        audioPath = tempFolder;
      });
    }

    @override
    void initState() {
    // TODO: implement initState
      loadAudioFiles();
      loadMergedFolder();
      loadAudioFolder();
    super.initState();
  }



    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Create Episode'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(
                  context); // Quay lại màn hình trước đó khi nhấn nút quay lại
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Episode Details',
                style: mST24M,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 24),
                      Text(
                        'Tên episode',
                        style: mST14M,
                      ),
                      SizedBox(height: 8),
                      TextField(
                        controller: _podcastName,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: 32),
                      Text(
                          'Mô tả episode',
                          style: mST14M
                      ),
                      SizedBox(height: 8),
                      TextField(
                        controller: _podcastDescription,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 3,
                      ),
                      SizedBox(height: 32),
                      Text(
                          'Đổi ảnh nền',
                          style: mST14M
                      ),
                      SizedBox(height: 32),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _image != null
                            ? GestureDetector(
                                onTap: () async {
                                  //_showImageOptions();
                                  final file = await _picker.pickImage(
                                      source: ImageSource.gallery);
                                  if (file != null) {
                                    context
                                        .read<CreateNewEpisodeCubit>()
                                        .changeImage(file);
                                    _image = file as File?;
                                  }
                                },
                                child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.file(
                                    _image!,
                                    height: 100.0,
                                    width: 100.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  right: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        _showImageOptions();
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        size: 30.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                              : GestureDetector(
                            onTap: () {
                              _showImageOptions();
                            },
                            child: Column(
                              children: [
                                Icon(
                                  Icons.camera_alt,
                                  size: 50.0,
                                  color: Colors.grey,
                                ),
                                SizedBox(height: 8.0),
                                Text(
                                  'Upload an image',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                  'Episode #',
                                  style: mST20M
                              ),
                              SizedBox(width: mSpacing,),
                              Container(
                                width: 100,
                                child: TextField(
                                  controller: _podcastNameTag,
                                  textAlign: TextAlign.center,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      // TODO: Xử lý khi nhấn nút Save Podcast
                      await loadAudioFiles();
                      loadMergedFolder();
                      loadAudioFolder();
                      if (listRecorded.length > 1) {
                        await mergeAudioFiles2(
                            listRecorded
                                .map((file) => file.path)
                                .toList(),
                            mergePath);
                      }
                      context.read<CreateNewEpisodeCubit>().changeDes(_podcastDescription.text);
                      context.read<CreateNewEpisodeCubit>().changeName('#${_podcastNameTag.text} ${_podcastName.text}');
                      context.read<CreateNewEpisodeCubit>().changeDuration(12000);
                      context.read<CreateNewEpisodeCubit>().changePodcastID('podcastID');
                      context.read<CreateNewEpisodeCubit>().changeHref('test');

                      context.read<CreateNewEpisodeCubit>().createEpisode(audioUpload: listRecorded.first);

                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, // Màu nền xanh lá
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0), // Góc bo tròn
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 24.0),
                      child: Text(
                        'Save Podcast',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      );
    }

    void _showImageOptions() {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: Icon(Icons.camera_alt),
                title: Text('Take Camera Picture'),
                onTap: () {
                  Navigator.pop(context);
                  _getImageFromCamera();
                },
              ),
              ListTile(
                leading: Icon(Icons.image),
                title: Text('Get Picture from Gallery'),
                onTap: () {
                  Navigator.pop(context);
                  _getImageFromGallery();
                },
              ),
            ],
          );
        },
      );
    }
  }
