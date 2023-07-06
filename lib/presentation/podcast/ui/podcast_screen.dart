import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';
import 'package:join_podcast/common/widgets/m_Author.dart';
import 'package:join_podcast/common/widgets/m_episode_component_with_event.dart';
import 'package:join_podcast/common/widgets/m_section.dart';
import 'package:join_podcast/models/episode_model.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:expandable_text/expandable_text.dart';

class PodcastScreen extends StatelessWidget {
  const PodcastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(MultiLanguage.of(context).author),
        actions: [
          PopupMenuButton<int>(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 0,
                child: Row(
                  children: [
                    const Icon(Icons.share),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(MultiLanguage.of(context).share)
                  ],
                ),
              ),
              PopupMenuItem(
                value: 1,
                child: Row(
                  children: const [
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
                    const Icon(Icons.report),
                    const SizedBox(
                      width: 10.0,
                    ),
                    Text(MultiLanguage.of(context).report)
                  ],
                ),
              )
            ],
            offset: const Offset(0, 50),
            onSelected: null,
          )
        ],
      ),
      body: CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
        MultiSliver(children: [
          Container(
            margin: const EdgeInsets.all(10.0),
            height: 125.0,
            child: Row(
              children: [
                const MAuthor(networkImage: null),
                const SizedBox(
                  width: 10.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                  Text(MultiLanguage.of(context).subscribe,
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
            action: IconButton(
                onPressed: () => {
                      showModalBottomSheet(
                          context: context,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                            top: Radius.circular(30),
                          )),
                          builder: (context) => Container(
                                padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Center(
                                        child: Container(
                                          width: 50,
                                          padding: EdgeInsets.only(bottom: 20),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(10))),
                                          child: Divider(
                                            color: mCGray100,
                                            thickness: 3,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "Sort & Filter",
                                        style: textBigTitleStyleH2,
                                      ),
                                      Divider(
                                        color: mCGray200,
                                        thickness: 0.5,
                                        height: 40,
                                      ),
                                      FlutterLogo(
                                        size: 120,
                                      ),
                                      Divider(
                                        color: mCGray200,
                                        thickness: 0.5,
                                        height: 40,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Expanded(
                                            child: ElevatedButton(
                                                child: Text("Reset",
                                                    style: mST16M.copyWith(
                                                        color: mCGreen500)),
                                                style: ButtonStyle(
                                                  padding: MaterialStateProperty
                                                      .all<EdgeInsets>(
                                                          EdgeInsets.symmetric(
                                                              vertical: 15)),
                                                  elevation:
                                                      MaterialStateProperty.all<
                                                          double>(5),
                                                  shadowColor:
                                                      MaterialStateProperty.all<
                                                          Color>(mCGreen100),
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                          Color>(mCGreen100),
                                                  shape:
                                                      MaterialStateProperty.all(
                                                    RoundedRectangleBorder(
                                                      // Change your radius here
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                    ),
                                                  ),
                                                ),
                                                onPressed: () => null),
                                          ),
                                          SizedBox(width: 20),
                                          Expanded(
                                            child: ElevatedButton(
                                                child: Text("Apply",
                                                    style: mST16M.copyWith(
                                                        color: Colors.white)),
                                                style: ButtonStyle(
                                                  padding: MaterialStateProperty
                                                      .all<EdgeInsets>(
                                                          EdgeInsets.symmetric(
                                                              vertical: 15)),
                                                  elevation:
                                                      MaterialStateProperty.all<
                                                          double>(5),
                                                  shadowColor:
                                                      MaterialStateProperty.all<
                                                          Color>(mCGreen300),
                                                  textStyle:
                                                      MaterialStateProperty.all(
                                                    const TextStyle(
                                                        fontSize: 20),
                                                  ),
                                                  backgroundColor:
                                                      MaterialStateProperty.all<
                                                          Color>(mCGreen500),
                                                  shape:
                                                      MaterialStateProperty.all(
                                                    RoundedRectangleBorder(
                                                      // Change your radius here
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                    ),
                                                  ),
                                                ),
                                                onPressed: () => null),
                                          ),
                                        ],
                                      )
                                    ]),
                              ))
                    },
                icon: Icon(Icons.sort)),
            content: Container(
              child: ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                itemBuilder: (context, index) => MEpisodeComponentWithEvent(
                  data: EpisodeModel()
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
