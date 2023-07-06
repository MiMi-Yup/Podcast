import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';

class CustomModalBottomSheet extends StatelessWidget {
  final Function onCreatePlaylist;
  final Function onFinish;
  List<String> myList = [
    "Nội dung 1",
    "Nội dung 2",
    "Nội dung 3",
    "Nội dung 4",
    "Nội dung 5"
  ];

  CustomModalBottomSheet(
      {super.key, required this.onCreatePlaylist, required this.onFinish});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  MultiLanguage.of(context).save_to_lists,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: mST16R,
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => onCreatePlaylist,
                child: Row(
                  children: [
                    const Icon(Icons.add),
                    const SizedBox(width: 4.0),
                    Text(
                      MultiLanguage.of(context).new_playlist,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: mST16R,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16.0),
            ],
          ),
          const Divider(),
          ListView(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            children: List.generate(
              myList.length,
              (index) {
                return ListTile(
                  leading: Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                  title: Text(myList[index]),
                );
              },
            ),
          ),
          const Divider(),
          GestureDetector(
            onTap: () => onFinish,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.check),
                  const SizedBox(width: 6.0),
                  Text(
                    MultiLanguage.of(context).finished,
                    style: mST16R,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
