import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:configuration/style/style.dart';
import 'package:configuration/utility/constants/asset_constants.dart';
import 'package:flutter/material.dart';
import 'package:join_podcast/common/widgets/m_Author.dart';
import 'package:join_podcast/common/widgets/m_author_full.dart';
import 'package:join_podcast/common/widgets/m_podcast_component.dart';
import 'package:join_podcast/common/widgets/m_section.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/author/author_route.dart';
import 'package:join_podcast/presentation/notification/notification_route.dart';
import 'package:join_podcast/presentation/subscription/subscription_route.dart';

import '../../podcast/podcast_route.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 80,
          elevation: 0.0,
          title: Row(
            children: [
              SizedBox(
                  height: 60,
                  width: 60,
                  child: CircleAvatar(
                    foregroundImage: AssetImage(mALogo),
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  )),
              SizedBox(
                width: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "My Library",
                    style: mST24M,
                  )
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () =>
                    XMDRouter.pushNamed(routerIds[NotificationRoute]!),
                icon: Icon(Icons.history))
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: DefaultTabController(
                length: 2,
                initialIndex: 0,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment(0, 0),
                      child: TabBar(
                        labelColor: Theme.of(context).primaryColor,
                        labelStyle: Theme.of(context).textTheme.bodyMedium,
                        indicatorColor: Theme.of(context).primaryColor,
                        tabs: [
                          Tab(
                            text: 'Favorite',
                          ),
                          Tab(
                            text: 'Subscriptions',
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          ListView(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            children: [
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                padding: EdgeInsets.only(
                                    left: 10.0, right: 10.0, top: 15.0),
                                itemBuilder: (context, index) =>
                                    MPodcastComponent(
                                  title:
                                      "927: Deep Dive | How to Quit Your Job the Right Way",
                                  author: "Apple Talk",
                                  duration: Duration(minutes: 52, seconds: 25),
                                  networkImage: null,
                                ),
                                separatorBuilder: (context, index) => SizedBox(
                                  height: 16.0,
                                ),
                                itemCount: 10,
                              ),
                            ],
                          ),
                          ListView(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            children: [
                              ListView.separated(
                                shrinkWrap: true,
                                physics: const BouncingScrollPhysics(),
                                padding: EdgeInsets.only(
                                    left: 10.0, right: 10.0, top: 15.0),
                                itemBuilder: (context, index) => MAuthorFull(
                                  author: "Apple Talk",
                                  quantity: 888,
                                  networkImage: null,
                                  onPressed: () => XMDRouter.pushNamed(
                                      routerIds[AuthorRoute]!,
                                      arguments: {index: index}),
                                ),
                                separatorBuilder: (context, index) => SizedBox(
                                  height: 16.0,
                                ),
                                itemCount: 10,
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
