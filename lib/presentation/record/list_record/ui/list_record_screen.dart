import 'dart:async';

import 'package:configuration/route/xmd_router.dart';
import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/record/record_page/record_page_route.dart';

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
  bool isFirstTime = false;
  List<String> recordComponents = ['Component 1', 'Component 2', 'Component 3'];

  Widget _list() { 
    return ReorderableListView.builder(
      itemCount: recordComponents.length,
      onReorder: (oldIndex, newIndex) => setState(() {
        final index = newIndex > oldIndex ? newIndex - 1 : newIndex;

        final user = recordComponents.removeAt(oldIndex);
        recordComponents.insert(index, user);
      }),
      itemBuilder: (context, index) {
        final user = recordComponents[index];

        return buildUser(index, user);
      },
    );
  }

  Widget buildUser(int index, String user) => ListTile(
    key: ValueKey(user),
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
    leading: CircleAvatar(
      /*backgroundImage: NetworkImage(user.urlImage),*/
      radius: 30,
    ),
    title: Text(user/*.name*/),
    trailing: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(Icons.edit, color: Colors.black),
          onPressed: () => edit(index),
        ),
        IconButton(
          icon: Icon(Icons.delete, color: Colors.black),
          onPressed: () => remove(index),
        ),
      ],
    ),
  );

  void remove(int index) => setState(() => recordComponents.removeAt(index));

  void edit(int index) => showDialog(
    context: context,
    builder: (context) {
      var user = recordComponents[index];

      return AlertDialog(
        content: TextFormField(
          initialValue: user/*.name*/,
          onFieldSubmitted: (_) => Navigator.of(context).pop(),
          onChanged: (name) => setState(() => user/*.name*/ = name),
        ),
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      // recordpce (432:182)
      padding: const EdgeInsets.all(20),
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
            padding: EdgeInsets.all(10.0),
            child: isFirstTime ? CustomPaint(
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
                      XMDRouter.pushNamed(routerIds[RecordPageRoute]!);
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
  }
}
