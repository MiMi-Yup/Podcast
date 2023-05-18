import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';

class BackgroundMusicScreen extends StatelessWidget {
  const BackgroundMusicScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0.0,
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
        padding: const EdgeInsets.all(20),
        child: const Column(
          children: [
            Center(
              child: Text("data"),
            ),
          ],
        ),
      ),
    );
  }
}
