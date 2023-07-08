import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/common/widgets/m_author.dart';
import 'package:join_podcast/common/widgets/m_section.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/detail_episode/cubit/detail_episode_cubit.dart';
import 'package:join_podcast/presentation/player/player_route.dart';
import 'package:join_podcast/presentation/podcast/podcast_route.dart';
import 'package:sliver_tools/sliver_tools.dart';

class DetailEpisodeScreen extends StatelessWidget {
  const DetailEpisodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<DetailEpisodeCubit>().init();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: BlocBuilder<DetailEpisodeCubit, DetailEpisodeState>(
            builder: (context, state) => Text(
                  state.episode?.name ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                )),
      ),
      body: CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
        MultiSliver(children: [
          Container(
            margin: const EdgeInsets.all(10.0),
            height: 125.0,
            child: Row(
              children: [
                BlocBuilder<DetailEpisodeCubit, DetailEpisodeState>(
                  buildWhen: (previous, current) =>
                      previous.episode != current.episode,
                  builder: (context, state) =>
                      MAuthor(networkImage: state.episode?.image),
                ),
                SizedBox(
                  width: 10.0,
                ),
                BlocBuilder<DetailEpisodeCubit, DetailEpisodeState>(
                    buildWhen: (previous, current) =>
                        previous.podcast != current.podcast,
                    builder: (context, state) => GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () => XMDRouter.pushNamed(
                              routerIds[PodcastRoute]!,
                              arguments: {'id': state.podcast?.id}),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                state.podcast?.name ?? '',
                                style: mST18M,
                              ),
                              Text(
                                "${state.podcast?.episodes?.length ?? 0} ${MultiLanguage.of(context).episode}",
                                style: mST16R,
                              ),
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () => null,
                                      icon: Icon(Icons.circle)),
                                  IconButton(
                                      onPressed: () => null,
                                      icon: Icon(Icons.share))
                                ],
                              )
                            ],
                          ),
                        ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0),
            child: BlocBuilder<DetailEpisodeCubit, DetailEpisodeState>(
              buildWhen: (previous, current) =>
                  previous.episode != current.episode,
              builder: (context, state) => Text(
                "${Duration(seconds: state.episode?.duration?.toInt() ?? 0).inMinutes} ${MultiLanguage.of(context).mins}",
                style: mST16R.copyWith(color: Colors.grey),
              ),
            ),
          )
        ]),
        BlocBuilder<DetailEpisodeCubit, DetailEpisodeState>(
          buildWhen: (previous, current) => previous.episode != current.episode,
          builder: (context, state) => MSection(
              title: state.episode?.name ?? '',
              headerColor: Theme.of(context).scaffoldBackgroundColor,
              titleColor: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
              content: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 38.0,
                              padding: EdgeInsets.only(left: 4.0, right: 4.0),
                              decoration: BoxDecoration(
                                  color: mCPrimary,
                                  borderRadius: BorderRadius.circular(50.0)),
                              child: TextButton(
                                  onPressed: () => XMDRouter.pushNamed(
                                          routerIds[PlayerRoute]!,
                                          arguments: {
                                            "id": state.episode?.id,
                                            "listEpisodes": [state.episode!],
                                          }),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.play_arrow,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      Text(MultiLanguage.of(context).play,
                                          style: mST14M.copyWith(
                                              color: Colors.white))
                                    ],
                                  )),
                            ),
                            IconButton(
                                onPressed: () => null,
                                icon: Icon(Icons.playlist_add)),
                            IconButton(
                                onPressed: () => null,
                                icon: Icon(Icons.download_for_offline_outlined))
                          ],
                        ),
                        IconButton(
                            onPressed: () => null, icon: Icon(Icons.more_vert))
                      ],
                    ),
                    Text(
                      state.episode?.description ?? '',
                      style: mST20R,
                    )
                  ],
                ),
              )).builder(),
        )
      ]),
    );
  }
}
