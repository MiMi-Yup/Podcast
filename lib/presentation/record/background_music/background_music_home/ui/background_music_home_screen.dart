import 'package:configuration/l10n/l10n.dart';
import 'dart:math';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';

class BackgroundMusicHomeScreen extends StatelessWidget {
  const BackgroundMusicHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final listItem = [
      {
        "icon": const FaIcon(
          FontAwesomeIcons.drum,
          size: 50,
          color: Colors.white,
        ),
        "title": "Drum",
        "red": Random().nextInt(256),
        "green": Random().nextInt(256),
        "blue": Random().nextInt(256)
      },
      {
        "icon": const FaIcon(
          FontAwesomeIcons.drum,
          size: 50,
          color: Colors.white,
        ),
        "title": "Sound",
        "red": Random().nextInt(256),
        "green": Random().nextInt(256),
        "blue": Random().nextInt(256)
      },
      {
        "icon": const FaIcon(
          FontAwesomeIcons.drum,
          size: 50,
          color: Colors.white,
        ),
        "title": "Open Music",
        "red": Random().nextInt(256),
        "green": Random().nextInt(256),
        "blue": Random().nextInt(256)
      },
      {
        "icon": const FaIcon(
          FontAwesomeIcons.drum,
          size: 50,
          color: Colors.white,
        ),
        "title": "End Music",
        "red": Random().nextInt(256),
        "green": Random().nextInt(256),
        "blue": Random().nextInt(256)
      },
      {
        "icon": const FaIcon(
          FontAwesomeIcons.drum,
          size: 50,
          color: Colors.white,
        ),
        "title": "File",
        "red": Random().nextInt(256),
        "green": Random().nextInt(256),
        "blue": Random().nextInt(256)
      },
    ];

    return Scaffold(
      appBar: AppBar(
          elevation: 3.5,
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              XMDRouter.pop();
            },
          ),
          centerTitle: true,
          title: Text(
            MultiLanguage.of(context).background_music,
            style: mST24R.copyWith(fontWeight: FontWeight.w500),
          )
          // actions: [
          //   PopupMenuButton<int>(
          //     shape: const RoundedRectangleBorder(
          //         borderRadius: BorderRadius.all(Radius.circular(10))),
          //     itemBuilder: (context) => [
          //       PopupMenuItem(
          //         value: 2,
          //         child: Row(
          //           children: [
          //             const Icon(Icons.speed),
          //             const SizedBox(
          //               width: 10.0,
          //             ),
          //             Text(MultiLanguage.of(context).speed)
          //           ],
          //         ),
          //       ),
          //       PopupMenuItem(
          //         value: 2,
          //         child: Row(
          //           children: [
          //             const Icon(Icons.access_alarm),
          //             const SizedBox(
          //               width: 10.0,
          //             ),
          //             Text(MultiLanguage.of(context).reminder)
          //           ],
          //         ),
          //       ),
          //       PopupMenuItem(
          //         value: 0,
          //         child: Row(
          //           children: [
          //             const Icon(Icons.share),
          //             const SizedBox(
          //               width: 10.0,
          //             ),
          //             Text(MultiLanguage.of(context).share)
          //           ],
          //         ),
          //       ),
          //       const PopupMenuItem(
          //         value: 1,
          //         child: Row(
          //           children: [
          //             Icon(Icons.wifi),
          //             SizedBox(
          //               width: 10.0,
          //             ),
          //             Text("View RSS feed")
          //           ],
          //         ),
          //       ),
          //       PopupMenuItem(
          //         value: 2,
          //         child: Row(
          //           children: [
          //             const Icon(Icons.report),
          //             const SizedBox(
          //               width: 10.0,
          //             ),
          //             Text(MultiLanguage.of(context).report)
          //           ],
          //         ),
          //       ),
          //     ],
          //     offset: const Offset(0, 50),
          //     onSelected: null,
          //   )
          // ],
          ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: ListView.separated(
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: 20),
          itemCount: listItem.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                XMDRouter.pushNamed("BackgroundMusicDetailRoute",
                    arguments: {'title': listItem[index]['title']});
              },
              child: Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(
                      int.parse(listItem[index]['red'].toString()),
                      int.parse(listItem[index]['green'].toString()),
                      int.parse(listItem[index]['blue'].toString()),
                      1),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 1, color: Colors.purple),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const FaIcon(
                      FontAwesomeIcons.drum,
                      size: 50,
                      color: Colors.white,
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          listItem[index]['title'].toString(),
                          style: mST20R.copyWith(
                              fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
