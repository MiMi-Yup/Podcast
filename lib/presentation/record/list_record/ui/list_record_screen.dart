import 'package:configuration/l10n/l10n.dart';
import 'package:join_podcast/common/widgets/m_play_stop_button.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:configuration/style/style.dart';
import 'package:configuration/utility/constants/asset_constants.dart';
import 'package:flutter/material.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/author/author_route.dart';
import 'package:join_podcast/presentation/notification/notification_route.dart';
import 'package:join_podcast/presentation/record/background_music/background_music_home/background_music_home_route.dart';
import 'package:join_podcast/presentation/subscription/subscription_route.dart';
import 'package:join_podcast/presentation/record/background_music/background_music_route.dart';
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
  @override
  Widget build(BuildContext context) {
    return Container(
      // recordpce (432:182)
      padding: const EdgeInsets.all(20),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xffffffff),
      ),
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
            child: CustomPaint(
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
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 80,
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        // Xử lý sự kiện khi nhấn vào nút
                        XMDRouter.pushNamed(routerIds[BackgroundMusicRoute]!);
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
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 80,
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        // Xử lý sự kiện khi nhấn vào nút
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
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 80,
                height: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        // Xử lý sự kiện khi nhấn vào nút
                        XMDRouter.pushNamed(routerIds[BackgroundMusicRoute]!);
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
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
