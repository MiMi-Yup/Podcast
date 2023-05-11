import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';
import 'package:join_podcast/common/widgets/m_Author.dart';
import 'package:join_podcast/common/widgets/m_podcast_component.dart';
import 'package:join_podcast/common/widgets/m_section.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/episode/episode_route.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:expandable_text/expandable_text.dart';

class AuthorScreen extends StatelessWidget {
  const AuthorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(MultiLanguage.of(context).author),
        actions: [
          PopupMenuButton<int>(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 0,
                child: Row(
                  children: [
                    Icon(Icons.share),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(MultiLanguage.of(context).share)
                  ],
                ),
              ),
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: [
                    Icon(Icons.wifi),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text("View RSS feed")
                  ],
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: Row(
                  children: [
                    Icon(Icons.report),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(MultiLanguage.of(context).report)
                  ],
                ),
              )
            ],
            offset: Offset(0, 50),
            onSelected: null,
          )
        ],
      ),
      body: CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
        MultiSliver(children: [
          Container(
            margin: const EdgeInsets.all(10.0),
            height: 125.0,
            child: Row(
              children: [
                MAuthor(networkImage: null),
                SizedBox(
                  width: 10.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "The Breakfast Club",
                      style: mST18M,
                    ),
                    Text(
                      "999 podcasts",
                      style: mST16R,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 38.0,
                          padding: EdgeInsets.only(left: 4.0, right: 4.0),
                          decoration: BoxDecoration(
                              color: mCPrimary,
                              borderRadius: BorderRadius.circular(50.0)),
                          child: TextButton(
                              onPressed: () => null,
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(MultiLanguage.of(context).subcribe,
                                      style:
                                          mST14M.copyWith(color: Colors.white))
                                ],
                              )),
                        ),
                        IconButton(
                            onPressed: () => null, icon: Icon(Icons.circle)),
                        IconButton(
                            onPressed: () => null, icon: Icon(Icons.share))
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: ExpandableText(
              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
              expandText: MultiLanguage.of(context).showMore,
              collapseText: MultiLanguage.of(context).showLess,
              maxLines: 4,
              linkColor: mCPrimary,
            ),
          )
        ]),
        MSection(
            title: "1.258 Episodes",
            headerColor: Theme.of(context).scaffoldBackgroundColor,
            titleColor: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
            onPressed: () => showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0)),
                  ),
                  builder: (context) => Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text("data"),
                  ),
                ),
            action: IconButton(onPressed: () => null, icon: Icon(Icons.sort)),
            content: Container(
              child: ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                itemBuilder: (context, index) => MPodcastComponent(
                  title: "927: Deep Dive | How to Quit Your Job the Right Way",
                  author: "Apple Talk",
                  duration: Duration(minutes: 52, seconds: 25),
                  networkImage: null,
                  onPressed: () =>
                      XMDRouter.pushNamed(routerIds[EpisodeRoute]!),
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: 16.0,
                ),
                itemCount: 10,
              ),
            )).builder()
      ]),
    );
  }
}
