import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';

class CustomModalBottomSheet extends StatefulWidget {
  final List<String>? listTitle;
  final Function? onCreatePlaylist;
  final Function? onFinish;

  const CustomModalBottomSheet({
    Key? key,
    required this.onCreatePlaylist,
    required this.onFinish,
    required this.listTitle,
  }) : super(key: key);

  @override
  State<CustomModalBottomSheet> createState() => _CustomModalBottomSheetState();
}

class _CustomModalBottomSheetState extends State<CustomModalBottomSheet> {
  List<bool> listChecking = [];

  List<String> listIdListRemove = [];
  List<String> listIdListAdd = [];

  @override
  void initState() {
    super.initState();
    //  Khởi tại giá trị checking đầ vào
    for (int i = 0; i < widget.listTitle!.length; i++) {
      i % 2 == 0 ? listChecking.add(true) : listChecking.add(false);
    }
  }

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
                onTap: widget.onCreatePlaylist!(),
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
          SizedBox(
            height: 220,
            child: ListView(
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              children: List.generate(
                widget.listTitle!.length,
                (index) {
                  return ListTile(
                    leading: Checkbox(
                      value: listChecking[index],
                      onChanged: (value) {
                        setState(() {
                          listChecking[index] = value!;
                        });
                      },
                      activeColor: mCGreen500,
                    ),
                    title: Text(
                      widget.listTitle![index],
                      style: mST14R,
                    ),
                  );
                },
              ),
            ),
          ),
          const Divider(),
          GestureDetector(
            onTap: widget.onFinish!(),
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
