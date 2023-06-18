import 'package:configuration/route/xmd_router.dart';
import 'package:configuration/style/style.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:media_info/media_info.dart';
import 'dart:io';
import 'package:path/path.dart' as path;

String _formatDuration(Duration? duration) {
  if (duration == null) {
    return ("--:--");
  } else {
    String minutes = duration.inMinutes.toString().padLeft(2, '0');
    String seconds =
        duration.inSeconds.remainder(60).toString().padLeft(2, '0');
    return ('$minutes:$seconds');
  }
}

class BackgroundMusicDetailScreen extends StatefulWidget {
  final String title;
  const BackgroundMusicDetailScreen({
    super.key,
    required this.title,
  });

  @override
  State<BackgroundMusicDetailScreen> createState() =>
      _BackgroundMusicDetailScreenState();
}

class _BackgroundMusicDetailScreenState
    extends State<BackgroundMusicDetailScreen> {
  List<Map<String, String>> dataDemo = [
    {
      'title': 'Avatar: Braving the Elements',
      'duration': _formatDuration(const Duration(minutes: 4, seconds: 24)),
      'linkUrl': 'https://i1.feedspot.com/200/5393324.jpg?t=1650621442'
    },
    {
      'title': 'Bending Not Breaking: An Avatar The Last Airbender Podcast',
      'duration': _formatDuration(const Duration(minutes: 2, seconds: 28)),
      'linkUrl': 'https://i1.feedspot.com/200/5393315.jpg?t=1650621667'
    },
    {
      'title': 'Avatar: The Last Airbender: Distorted Reality',
      'duration': _formatDuration(const Duration(minutes: 6, seconds: 54)),
      'linkUrl': 'https://i1.feedspot.com/200/5393325.jpg?t=1650621278'
    },
    {
      'title': 'I Need Some Air(Bending): An Avatar Fancast',
      'duration': _formatDuration(const Duration(minutes: 4, seconds: 3)),
      'linkUrl': 'https://i1.feedspot.com/200/5393321.jpg?t=1650619315'
    },
    {
      'title': 'Avatar: The First Viewing',
      'duration': _formatDuration(const Duration(minutes: 6, seconds: 12)),
      'linkUrl': 'https://i1.feedspot.com/200/5393319.jpg?t=1650620623'
    },
  ];

  @override
  Widget build(BuildContext context) {
    File? file;
    PlatformFile? platformFile;

    void uploadFiles() async {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.audio,
        allowMultiple: true,
      );
      if (result != null) {
        file = File(result.files.first.path!);
        platformFile = result.files.first;
        // final MediaInfo mediaInfo = MediaInfo();
        // final Map<String, dynamic> info =
        //     await mediaInfo.getMediaInfo(result.files.first.path!);
        setState(() {
          Map<String, String> newItem = {
            'title': "abc",
            'duration': "03:23",
            'linkUrl': 'https://i1.feedspot.com/200/5393319.jpg?t=1650620623'
          };
          dataDemo.add(newItem);
          // dataDemo.add({
          //   'title': path.basenameWithoutExtension(file!.path),
          //   'duration': info["durationMs"],
          //   'linkUrl': 'https://i1.feedspot.com/200/5393319.jpg?t=1650620623'
          // });
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
          elevation: 3.5,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              XMDRouter.pop();
            },
          ),
          centerTitle: true,
          title: Text(
            widget.title,
            style: mST24R.copyWith(fontWeight: FontWeight.w500),
          )),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.title == "File")
              Column(
                children: [
                  GestureDetector(
                    onTap: uploadFiles,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.green.shade400,
                                borderRadius: BorderRadius.circular(5),
                                border:
                                    Border.all(color: Colors.grey, width: 1),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.add,
                                    size: 24,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Add From Files",
                                    style: mST18R.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ListView.separated(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (BuildContext context, int index) =>
                  const SizedBox(height: 10),
              itemCount: dataDemo.length,
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            image: DecorationImage(
                              image: NetworkImage(dataDemo[index]['linkUrl']!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Wrap(
                          direction: Axis.vertical,
                          alignment: WrapAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 220,
                              child: Text(
                                dataDemo[index]['title']!,
                                style: mST16R,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: 220,
                              child: Text(
                                dataDemo[index]['duration']!,
                                style: mST14R,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                        color: Colors.green,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
