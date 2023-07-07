import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/common/widgets/m_author_full.dart';
import 'package:join_podcast/common/widgets/m_episode_component.dart';
import 'package:join_podcast/common/widgets/m_episode_component_with_event.dart';
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
  late TabController _tabController;
  late List<ScrollController> _scrollControllers;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _scrollControllers = [
      ScrollController()..addListener(_lazyLoadingListView),
      ScrollController()..addListener(_lazyLoadingListView),
      ScrollController()..addListener(_lazyLoadingListView)
    ];
    _tabController.addListener(_listenerTabChange);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.removeListener(_listenerTabChange);
    for (var element in _scrollControllers) {
      element.removeListener(_lazyLoadingListView);
      element.dispose();
    }
    _tabController.dispose();
  }

  void _listenerTabChange() {
    if (!_tabController.indexIsChanging) {
      switch (_tabController.index) {
        case 0:
          context.read<SearchCubit>().searchPodcast();
          break;
        case 1:
          context.read<SearchCubit>().searchChannel();
          break;
        case 2:
          context.read<SearchCubit>().searchEpisode();
          break;
        default:
      }
    }
  }

  void _lazyLoadingListView() {
    final index = _tabController.index;
    final controller = _scrollControllers[index];
    if (controller.position.extentAfter < 500) {
      switch (index) {
        case 0:
          context.read<SearchCubit>().searchPodcast();
          break;
        case 1:
          context.read<SearchCubit>().searchChannel();
          break;
        case 2:
          context.read<SearchCubit>().searchEpisode();
          break;
        default:
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return mSearch.SearchBar(
        history: context.read<SearchCubit>().getHistorySearch,
        onSubmitted: (query) {
          final cubit = context.read<SearchCubit>();
          cubit.submitSearch(query);
          if (_tabController.index != 0) {
            _tabController.animateTo(0);
          } else {
            cubit.searchPodcast();
          }
        },
        removeSearchHistory: context.read<SearchCubit>().removeSearchHistory,
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
                    text: MultiLanguage.of(context).podcast,
                  ),
                  Tab(
                    text: MultiLanguage.of(context).channel,
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
                    //podcast tab
                    BlocBuilder<SearchCubit, SearchState>(
                      buildWhen: (previous, current) =>
                          previous.podcasts != current.podcasts,
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
                        itemCount: state.podcasts?.length ?? 0,
                      ),
                    ),
                    //channel tab
                    BlocBuilder<SearchCubit, SearchState>(
                      buildWhen: (previous, current) =>
                          previous.channels != current.channels,
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
                        itemCount: state.channels?.length ?? 0,
                      ),
                    ),
                    //episode tab
                    BlocBuilder<SearchCubit, SearchState>(
                        buildWhen: (previous, current) =>
                            previous.episodes != current.episodes,
                        builder: (context, state) => ListView.separated(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              padding: EdgeInsets.only(
                                  left: 10.0, right: 10.0, top: 10.0),
                              itemBuilder: (context, index) =>
                                  MEpisodeComponentWithEvent(
                                data: state.episodes![index],
                              ),
                              separatorBuilder: (context, index) => SizedBox(
                                height: 16.0,
                              ),
                              itemCount: state.episodes?.length ?? 0,
                            )),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
