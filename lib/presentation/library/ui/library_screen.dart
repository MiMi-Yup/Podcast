import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/common/widgets/m_episode_component.dart';
import 'package:join_podcast/common/widgets/m_playlist.dart';
import 'package:join_podcast/common/widgets/m_text_field_bottom_modal.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/library/cubit/library_cubit.dart';
import 'package:join_podcast/presentation/notification/notification_route.dart';
import 'package:join_podcast/presentation/playlist/playlist_route.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late TextEditingController _controller;
  bool isFavouritePage = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _controller = TextEditingController();
    _tabController.addListener(() {
      if (_tabController.index == 1 && isFavouritePage) {
        setState(() {
          isFavouritePage = false;
        });
      } else if (_tabController.index == 0 && isFavouritePage == false) {
        setState(() {
          isFavouritePage = true;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.0,
          title: Text(MultiLanguage.of(context).library),
          actions: [
            if (isFavouritePage)
              IconButton(
                  onPressed: () =>
                      XMDRouter.pushNamed(routerIds[NotificationRoute]!),
                  icon: Icon(Icons.history)),
            if (!isFavouritePage)
              IconButton(
                  onPressed: () async {
                    final result = await showTextFieldBottomModal(
                        context, "New Playlist", _controller);
                    if (result != null && result.isNotEmpty) {
                      final newPlaylist = await context
                          .read<LibraryCubit>()
                          .createPlaylist(name: result);
                      if (newPlaylist != null) {
                        XMDRouter.pushNamed(routerIds[PlaylistRoute]!,
                            arguments: {'playlist': newPlaylist});
                      }
                    }
                  },
                  icon: Icon(Icons.add))
          ],
        ),
        body: Column(
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
                  text: MultiLanguage.of(context).favourite,
                ),
                Tab(
                  text: MultiLanguage.of(context).playlist,
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    padding:
                        EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0),
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
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    padding:
                        EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0),
                    itemBuilder: (context, index) => MPlaylist(
                      name: "Apple Talk",
                      quantity: 888,
                      networkImage: null,
                      onPressed: () => XMDRouter.pushNamed(
                          routerIds[PlaylistRoute]!,
                          arguments: {index: index}),
                    ),
                    separatorBuilder: (context, index) => SizedBox(
                      height: 16.0,
                    ),
                    itemCount: 10,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
