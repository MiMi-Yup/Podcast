import 'package:configuration/l10n/l10n.dart';
import 'package:join_podcast/common/widgets/m_play_stop_button.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:configuration/style/style.dart';
import 'package:configuration/utility/constants/asset_constants.dart';
import 'package:flutter/material.dart';
import 'package:join_podcast/common/widgets/m_Author.dart';
import 'package:join_podcast/common/widgets/m_podcast_component.dart';
import 'package:join_podcast/common/widgets/m_section.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/author/author_route.dart';
import 'package:join_podcast/presentation/notification/notification_route.dart';
import 'package:join_podcast/presentation/record/background_music/background_music_route.dart';
import 'package:join_podcast/presentation/subscription/subscription_route.dart';

class ListRecordScreen extends StatefulWidget {
  const ListRecordScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<ListRecordScreen> createState() => _ListRecordScreen();
}

class _ListRecordScreen extends State<ListRecordScreen> {
  bool isFirstTime = false;
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
                MultiLanguage.of(context).record,
                style: mST32R.copyWith(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Text(
            '00:00:00',
            textAlign: TextAlign.center,
            style: mST24R.copyWith(
                color: Colors.black, fontWeight: FontWeight.w500),
          ),
          Container(
            height: 300,
            decoration: BoxDecoration(color: Colors.blueGrey.shade300),
            child: const Text("Vùng chứa tần số!", style: mST18R),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {},
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.grey,
                ),
              ),
              isFirstTime
                  ? TextButton(
                      onPressed: () {
                        setState(() {
                          isFirstTime = !isFirstTime;
                        });
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.red.shade800,
                          shape: BoxShape.circle,
                        ),
                      ))
                  : PlayStopButton(),
              TextButton(
                onPressed: () {
                  XMDRouter.pushNamed(routerIds[BackgroundMusicRoute]!);
                },
                child: const Icon(
                  Icons.stop,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
