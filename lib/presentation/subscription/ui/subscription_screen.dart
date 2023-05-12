import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:flutter/material.dart';
import 'package:join_podcast/common/widgets/m_author_full.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/author/author_route.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(MultiLanguage.of(context).subscription),
          actions: [
            IconButton(
                onPressed: () => null,
                icon: RotationTransition(
                    filterQuality: FilterQuality.high,
                    child: Icon(Icons.link),
                    turns: AlwaysStoppedAnimation(-45 / 360))),
            PopupMenuButton<int>(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 0,
                  child: Row(
                    children: [
                      Icon(Icons.sort_by_alpha),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(MultiLanguage.of(context).sortByName)
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: [
                      Icon(Icons.sort),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(MultiLanguage.of(context).sortByPodcast)
                    ],
                  ),
                )
              ],
              offset: Offset(0, 50),
              onSelected: null,
              icon: Icon(Icons.sort),
            )
          ],
        ),
        body: ListView.separated(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.all(10.0),
          itemBuilder: (context, index) => MAuthorFull(
            author: "Apple Talk",
            quantity: 888,
            networkImage: null,
            onPressed: () => XMDRouter.pushNamed(routerIds[AuthorRoute]!,
                arguments: {index: index}),
          ),
          separatorBuilder: (context, index) => SizedBox(
            height: 16.0,
          ),
          itemCount: 10,
        ));
  }
}
