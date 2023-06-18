import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:configuration/style/style.dart';
import 'package:configuration/utility/constants/asset_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/common/widgets/m_Author.dart';
import 'package:join_podcast/common/widgets/m_episode_component.dart';
import 'package:join_podcast/common/widgets/m_section.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/author/author_route.dart';
import 'package:join_podcast/presentation/home/home_tab/cubit/home_cubit.dart';
import 'package:join_podcast/presentation/home/search/search_route.dart';
import 'package:join_podcast/presentation/notification/notification_route.dart';
import 'package:join_podcast/presentation/podcast/podcast_route.dart';
import 'package:join_podcast/presentation/subscription/subscription_route.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  String greetingTime(MultiLanguage language) {
    final hour = DateTime.now().hour;
    if (hour <= 12) return language.goodMorning;
    if (hour <= 16) return language.goodAfternoon;
    if (hour <= 20) return language.goodEvening;
    return language.goodNight;
  }

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
                    foregroundImage: NetworkImage(context.read<HomeCubit>().avatar!),
                    backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  )),
              SizedBox(
                width: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    greetingTime(MultiLanguage.of(context)),
                    style: mST16R.copyWith(color: Colors.grey),
                  ),
                  Text(
                    context.read<HomeCubit>().userName ??
                        MultiLanguage.of(context).username,
                    style: mST18M,
                  )
                ],
              ),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () => XMDRouter.pushNamed(routerIds[SearchRoute]!),
                icon: const Icon(Icons.search)),
            IconButton(
                onPressed: () =>
                    XMDRouter.pushNamed(routerIds[NotificationRoute]!),
                icon: const Icon(Icons.notifications))
          ],
        ),
        body: Column(
          children: [
            Expanded(
                child: CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                MSection(
                    title: MultiLanguage.of(context).subscription,
                    headerColor: Theme.of(context).scaffoldBackgroundColor,
                    titleColor: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                    action: TextButton(
                      onPressed: () =>
                          XMDRouter.pushNamed(routerIds[SubscriptionRoute]!),
                      child: Text(MultiLanguage.of(context).seeAll),
                    ),
                    onPressed: () =>
                        XMDRouter.pushNamed(routerIds[SubscriptionRoute]!),
                    content: SizedBox(
                      height: 125.0,
                      child: ListView.separated(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => MAuthor(
                          networkImage: null,
                          onPressed: () => XMDRouter.pushNamed(
                              routerIds[AuthorRoute]!,
                              arguments: {index: index}),
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          width: 10,
                        ),
                        itemCount: 10,
                      ),
                    )).builder(),
                MSection(
                    title: MultiLanguage.of(context).newUpdates,
                    headerColor: Theme.of(context).scaffoldBackgroundColor,
                    titleColor: Theme.of(context).brightness == Brightness.dark
                        ? Colors.white
                        : Colors.black,
                    onPressed: () => null,
                    action: TextButton(
                      onPressed: () => null,
                      child: Text(MultiLanguage.of(context).seeAll),
                    ),
                    content: Container(
                      child: ListView.separated(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        itemBuilder: (context, index) => MEpisodeComponent(
                          title:
                              "927: Deep Dive | How to Quit Your Job the Right Way",
                          author: "Apple Talk",
                          duration: Duration(minutes: 52, seconds: 25),
                          networkImage: null,
                          onPlay: (state) => !state,
                          onDownload: (state) => !state,
                          onPressed: () =>
                              XMDRouter.pushNamed(routerIds[PodcastRoute]!),
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 16.0,
                        ),
                        itemCount: 10,
                      ),
                    )).builder()
              ],
            ))
          ],
        ));
  }
}