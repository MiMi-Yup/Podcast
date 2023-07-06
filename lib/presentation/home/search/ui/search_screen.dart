import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/common/widgets/m_author_full.dart';
import 'package:join_podcast/common/widgets/m_episode_component.dart';
import 'package:join_podcast/common/widgets/m_search_bar.dart' as mSearch;
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/home/search/cubit/search_cubit.dart';
import 'package:join_podcast/presentation/podcast/podcast_route.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with SingleTickerProviderStateMixin {
  late TextEditingController _controller;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return mSearch.SearchBar(
        history: context.read<SearchCubit>().getHistorySearch,
        body: Padding(
          padding: const EdgeInsets.only(top: 85),
          child: Column(
            children: [
              TabBar(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                controller: _tabController,
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                    color: mCPrimary),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(
                    text: MultiLanguage.of(context).channel,
                  ),
                  Tab(
                    text: MultiLanguage.of(context).podcast,
                  ),
                  Tab(
                    text: MultiLanguage.of(context).episode,
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    //channel tab
                    BlocBuilder<SearchCubit, SearchState>(
                      builder: (context, state) => ListView.separated(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        padding:
                            EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                        itemBuilder: (context, index) => MEpisodeComponent(
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
                    ),
                    //podcast tab
                    BlocBuilder<SearchCubit, SearchState>(
                      builder: (context, state) => ListView.separated(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        padding:
                            EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                        itemBuilder: (context, index) => MAuthorFull(
                          author: "Apple Talk",
                          quantity: 888,
                          networkImage: null,
                          onPressed: () => XMDRouter.pushNamed(
                              routerIds[PodcastRoute]!,
                              arguments: {index: index}),
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 16.0,
                        ),
                        itemCount: 10,
                      ),
                    ),
                    //episode tab
                    BlocBuilder<SearchCubit, SearchState>(
                      builder: (context, state) => state is SearchStateInitial
                          ? ListView.separated(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              padding: EdgeInsets.only(
                                  left: 10.0, right: 10.0, top: 10.0),
                              itemBuilder: (context, index) =>
                                  MEpisodeComponent(
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
                            )
                          : const SizedBox.shrink(),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
