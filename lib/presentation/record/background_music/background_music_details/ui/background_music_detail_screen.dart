import 'package:configuration/route/xmd_router.dart';
import 'package:configuration/style/style.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

final dataDemo = [
  {
    'title': 'Avatar: Braving the Elements',
    'author': 'John Smith',
    'linkUrl': 'https://i1.feedspot.com/200/5393324.jpg?t=1650621442'
  },
  {
    'title': 'Bending Not Breaking: An Avatar The Last Airbender Podcast',
    'author': 'Demo Team',
    'linkUrl': 'https://i1.feedspot.com/200/5393315.jpg?t=1650621667'
  },
  {
    'title': 'Avatar: The Last Airbender: Distorted Reality',
    'author': 'Smooth Text',
    'linkUrl': 'https://i1.feedspot.com/200/5393325.jpg?t=1650621278'
  },
  {
    'title': 'I Need Some Air(Bending): An Avatar Fancast',
    'author': 'Thousands Of Fancast',
    'linkUrl': 'https://i1.feedspot.com/200/5393321.jpg?t=1650619315'
  },
  {
    'title': 'Avatar: The First Viewing',
    'author': 'Lore Thou',
    'linkUrl': 'https://i1.feedspot.com/200/5393319.jpg?t=1650620623'
  },
];

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
  @override
  Widget build(BuildContext context) {
    void uploadFiles() async {
      FilePickerResult? result =
          await FilePicker.platform.pickFiles(type: FileType.audio);
      if (result == null) return;
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
                          width: 5,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 200,
                              child: Text(
                                dataDemo[index]['title']!,
                                style: mST16R,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(
                              width: 200,
                              child: Text(
                                dataDemo[index]['author']!,
                                style: mST16R.copyWith(color: Colors.grey),
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
