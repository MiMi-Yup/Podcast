import 'package:configuration/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:join_podcast/common/widgets/m_podcast_component.dart';
import 'package:join_podcast/common/widgets/m_section.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(MultiLanguage.of(context).notification),
        actions: [
          PopupMenuButton<int>(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 0,
                child: Row(
                  children: [
                    Icon(Icons.done_all),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(MultiLanguage.of(context).markDone)
                  ],
                ),
              ),
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(MultiLanguage.of(context).clear)
                  ],
                ),
              )
            ],
            offset: Offset(0, 50),
            onSelected: null,
            icon: Icon(Icons.more_horiz),
          )
        ],
      ),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          MSection(
              title: "New Podcast Release Today",
              headerColor: Theme.of(context).scaffoldBackgroundColor,
              titleColor: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
              content: ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                itemBuilder: (context, index) => MPodcastComponent(
                  title: "927: Deep Dive | How to Quit Your Job the Right Way",
                  author: "Apple Talk",
                  duration: Duration(minutes: 52, seconds: 25),
                  networkImage: null,
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: 16.0,
                ),
                itemCount: 5,
              )).builder(),
          MSection(
              title: "Yesterday",
              headerColor: Theme.of(context).scaffoldBackgroundColor,
              titleColor: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
              content: ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                itemBuilder: (context, index) => MPodcastComponent(
                  title: "927: Deep Dive | How to Quit Your Job the Right Way",
                  author: "Apple Talk",
                  duration: Duration(minutes: 52, seconds: 25),
                  networkImage: null,
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: 16.0,
                ),
                itemCount: 5,
              )).builder()
        ],
      ),
    );
  }
}
