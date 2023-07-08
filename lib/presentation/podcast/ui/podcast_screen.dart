import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/common/widgets/m_Author.dart';
import 'package:join_podcast/common/widgets/m_episode_component_with_event.dart';
import 'package:join_podcast/common/widgets/m_section.dart';
import 'package:join_podcast/common/widgets/m_toggle.dart';
import 'package:join_podcast/models/episode_model.dart';
import 'package:join_podcast/presentation/podcast/cubit/podcast_cubit.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:expandable_text/expandable_text.dart';

class PodcastScreen extends StatelessWidget {
  const PodcastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PodcastCubit>().init();
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(MultiLanguage.of(context).podcast),
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
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(), 
        slivers: [
        MultiSliver(children: [
          Container(
            margin: const EdgeInsets.all(10.0),
            height: 125.0,
            child: Row(children: [
              BlocBuilder<PodcastCubit, PodcastState>(
                buildWhen: (previous, current) => previous.podcast!=current.podcast,
                builder:(context, state) => MAuthor(networkImage: state.podcast?.image)),
              const SizedBox(
                width: 10.0,
              ),
              BlocBuilder<PodcastCubit, PodcastState>(
                  buildWhen: (previous, current) =>
                      previous.podcast != current.podcast,
                  builder: (context, state) => Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                              Container(
                                height: 38.0,
                                padding: EdgeInsets.only(left: 4.0, right: 4.0),
                                decoration: BoxDecoration(
                                    color: mCPrimary,
                                    borderRadius: BorderRadius.circular(50.0)),
                                child: BlocBuilder<PodcastCubit, PodcastState>(
                                  buildWhen: (previous, current) =>
                                      previous.podcast != current.podcast,
                                  builder: (context, state) => MToggle(
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.add,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 8.0,
                                        ),
                                        Text(
                                            MultiLanguage.of(context).subscribe,
                                            style: mST14M.copyWith(
                                                color: Colors.white))
                                      ],
                                    ),
                                    whenTrue: Row(
                                      children: [
                                        Icon(
                                          Icons.check,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 8.0,
                                        ),
                                        Text(
                                            MultiLanguage.of(context)
                                                .subscribed,
                                            style: mST14M.copyWith(
                                                color: Colors.white))
                                      ],
                                    ),
                                    initState:
                                        state.podcast?.isSubscribed ?? false,
                                    onToogle: (p0) => context
                                        .read<PodcastCubit>()
                                        .toogleSubscribe(),
                                  ),
                                ),
                              ),
                              IconButton(
                                  onPressed: () => null,
                                  icon: Icon(Icons.circle)),
                              IconButton(
                                  onPressed: () => null,
                                  icon: Icon(Icons.share))
                            ],
                          )
                        ],
                      ))
            ]),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: BlocBuilder<PodcastCubit, PodcastState>(
              buildWhen: (previous, current) =>
                  previous.podcast != current.podcast,
              builder: (context, state) => ExpandableText(
                state.podcast?.description ?? '',
                expandText: MultiLanguage.of(context).showMore,
                collapseText: MultiLanguage.of(context).showLess,
                maxLines: 4,
                linkColor: mCPrimary,
              ),
            ),
          )
        ]),
        BlocBuilder<PodcastCubit, PodcastState>(
          buildWhen: (previous, current) => previous.podcast != current.podcast,
          builder: (context, state) => MSection(
              title:
                  "${state.podcast?.count ?? 0} ${MultiLanguage.of(context).episode}",
              headerColor: Theme.of(context).scaffoldBackgroundColor,
              titleColor: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
              action: null,
              content: Container(
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  itemBuilder: (context, index) => MEpisodeComponentWithEvent(
                      data: state.podcast!.episodes![index]),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 16.0,
                  ),
                  itemCount: state.podcast?.episodes?.length ?? 0,
                ),
              )).builder(),
        )
      ]),
    );
  }
}
