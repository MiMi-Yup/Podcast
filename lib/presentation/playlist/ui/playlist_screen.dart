import 'package:blur/blur.dart';
import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:configuration/style/style.dart';
import 'package:configuration/utility/constants/asset_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/common/widgets/m_episode_component_with_event.dart';
import 'package:join_podcast/common/widgets/m_section.dart';
import 'package:join_podcast/common/widgets/m_text_field_bottom_modal.dart';
import 'package:join_podcast/data/data_source/runtime/player_storage_service.dart';
import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/player/player_route.dart';
import 'package:join_podcast/presentation/playlist/cubit/playlist_cubit.dart';

class PlaylistScreen extends StatelessWidget {
  PlaylistScreen({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    context.read<PlaylistCubit>().init();
    return Scaffold(
      body: CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
        SliverAppBar(
          elevation: 0.0,
          floating: true,
          title: Text(MultiLanguage.of(context).playlist),
          actions: [
            PopupMenuButton<int>(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              itemBuilder: (context) => [
                PopupMenuItem(
                  value: 0,
                  child: Row(
                    children: [
                      Icon(Icons.download),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(MultiLanguage.of(context).downloadAll)
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 1,
                  child: Row(
                    children: [
                      Icon(Icons.edit),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(MultiLanguage.of(context).rename)
                    ],
                  ),
                ),
                PopupMenuItem(
                  value: 2,
                  child: Row(
                    children: [
                      Icon(Icons.delete),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(MultiLanguage.of(context).delete)
                    ],
                  ),
                )
              ],
              offset: Offset(0, 50),
              onSelected: (index) async {
                switch (index) {
                  case 0:
                    //download all
                    break;
                  case 1:
                    final result = await showTextFieldBottomModal(
                        context, "New Playlist", _controller,
                        preText:
                            context.read<PlaylistCubit>().state.namePlaylist);
                    if (result != null && result.isNotEmpty) {
                      context
                          .read<PlaylistCubit>()
                          .updatePlaylist(name: result);
                    }
                    break;
                  case 2:
                    await context.read<PlaylistCubit>().deletePlaylist();
                    XMDRouter.pop();
                    break;
                  default:
                    break;
                }
              },
              icon: Icon(Icons.more_horiz),
            )
          ],
        ),
        SliverToBoxAdapter(
            child: Stack(alignment: Alignment.topCenter, children: [
          Image.asset(mAIntroduction1).blurred(
              colorOpacity: 0.2,
              borderRadius: BorderRadius.circular(8.0),
              blur: 16),
          Padding(
            padding:
                EdgeInsets.only(left: mSpacing, right: mSpacing, top: mSpacing),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    mAIntroduction1,
                    height: 175,
                    fit: BoxFit.scaleDown,
                  ),
                ),
                SizedBox(
                  height: mSpacing,
                ),
                BlocBuilder<PlaylistCubit, PlaylistState>(
                  buildWhen: (previous, current) =>
                      previous.namePlaylist != current.namePlaylist,
                  builder: (context, state) => Text(state.namePlaylist,
                      style: mST20M.copyWith(color: Colors.white)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        childAspectRatio: 3,
                        padding: EdgeInsets.all(mSpacing),
                        children: [
                          BlocBuilder<PlaylistCubit, PlaylistState>(
                            buildWhen: (previous, current) =>
                                previous.count != current.count,
                            builder: (context, state) => Text(
                              "${state.count} ${MultiLanguage.of(context).episode}",
                              style: mST14M.copyWith(color: Colors.white),
                            ),
                          ),
                          Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.timelapse,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: mSpacing,
                                ),
                                BlocBuilder<PlaylistCubit, PlaylistState>(
                                  buildWhen: (previous, current) =>
                                      previous.totalTime != current.totalTime,
                                  builder: (context, state) => Text(
                                      "${state.totalTime.inHours}h ${state.totalTime.inHours * 60 - state.totalTime.inMinutes}m",
                                      style:
                                          mST14M.copyWith(color: Colors.white)),
                                )
                              ]),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.download,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: mSpacing,
                              ),
                              BlocBuilder<PlaylistCubit, PlaylistState>(
                                buildWhen: (previous, current) =>
                                    previous.countDownload !=
                                    current.countDownload,
                                builder: (context, state) => Text(
                                    state.countDownload.toString(),
                                    style:
                                        mST14M.copyWith(color: Colors.white)),
                              )
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.done_all,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: mSpacing,
                              ),
                              BlocBuilder<PlaylistCubit, PlaylistState>(
                                buildWhen: (previous, current) =>
                                    previous.countWatched !=
                                    current.countWatched,
                                builder: (context, state) => Text(
                                    state.countWatched.toString(),
                                    style:
                                        mST14M.copyWith(color: Colors.white)),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 38.0,
                      padding: EdgeInsets.only(left: 4.0, right: 4.0),
                      decoration: BoxDecoration(
                          color: mCPrimary,
                          borderRadius: BorderRadius.circular(50.0)),
                      child: TextButton(
                          onPressed: () {
                            final episodes =
                                context.read<PlaylistCubit>().state.episodes;
                            if (episodes.isNotEmpty) {
                              getIt<EpisodePlayerManager>()
                                  .setListEpisodes(episodes);
                              XMDRouter.pushNamed(routerIds[PlayerRoute]!,
                                  arguments: {
                                    'listEpisodes': episodes,
                                    'id': episodes.first.id
                                  });
                            }
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.shuffle,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Text(
                                MultiLanguage.of(context).shufflePlay,
                                style: mST14M.copyWith(color: Colors.white),
                                overflow: TextOverflow.clip,
                              )
                            ],
                          )),
                    ),
                  ],
                )
              ],
            ),
          )
        ])),
        MSection(
            title: MultiLanguage.of(context).playlist,
            headerColor: Theme.of(context).scaffoldBackgroundColor,
            titleColor: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
            onPressed: () => null,
            action: PopupMenuButton<int>(
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
                      Icon(Icons.date_range),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(MultiLanguage.of(context).sortByDate)
                    ],
                  ),
                )
              ],
              offset: Offset(0, 50),
              onSelected: (index) {
                switch (index) {
                  case 0:
                    context.read<PlaylistCubit>().sortByName();
                    break;
                  case 1:
                    context.read<PlaylistCubit>().sortByDate();
                    break;
                  default:
                    break;
                }
              },
              icon: Icon(Icons.sort),
            ),
            content: BlocBuilder<PlaylistCubit, PlaylistState>(
              buildWhen: (previous, current) =>
                  previous.episodes != current.episodes,
              builder: (context, state) => ListView.separated(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                itemBuilder: (context, index) => MEpisodeComponentWithEvent(
                  data: state.episodes[index],
                  isAdmin: true,
                  listOption: [
                    Text(MultiLanguage.of(context).removeFromPlaylist)
                  ],
                  onMore: (p0) {
                    switch (p0) {
                      case 2:
                        context
                            .read<PlaylistCubit>()
                            .removeFromPlaylist(state.episodes[index]);
                        break;
                      default:
                        break;
                    }
                  },
                ),
                separatorBuilder: (context, index) => SizedBox(
                  height: 16.0,
                ),
                itemCount: state.count,
              ),
            )).builder()
      ]),
    );
  }
}
