import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/common/widgets/m_episode_component_with_event.dart';
import 'package:join_podcast/presentation/history/cubit/history_cubit.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  late ScrollController _controller;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_lazyLoadingListView);
    context.read<HistoryCubit>().getEpisode();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.removeListener(_lazyLoadingListView);
    _controller.dispose();
  }

  void _lazyLoadingListView() {
    if (_controller.position.extentAfter < 500) {
      context.read<HistoryCubit>().getEpisode();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(MultiLanguage.of(context).history),
        actions: [
          PopupMenuButton<int>(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 0,
                child: Row(
                  children: [
                    Icon(Icons.delete),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(MultiLanguage.of(context).clear)
                  ],
                ),
              )
            ],
            offset: Offset(0, 50),
            onSelected: (index) {
              switch (index) {
                case 0:
                  context.read<HistoryCubit>().removeHistoryAll();
                  XMDRouter.pop();
                  break;
                default:
              }
            },
            icon: Icon(Icons.more_horiz),
          )
        ],
      ),
      body: BlocBuilder<HistoryCubit, HistoryState>(
        buildWhen: (previous, current) => previous.episodes != current.episodes,
        builder: (context, state) => ListView.separated(
          controller: _controller,
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          itemBuilder: (context, index) => MEpisodeComponentWithEvent(
            data: state.episodes![index],
            listOption: [Text(MultiLanguage.of(context).delete)],
            onMore: (value) {
              switch (value) {
                case 2:
                  context
                      .read<HistoryCubit>()
                      .removeSearchHistory(state.episodes![index]);
                  break;
                default:
                  break;
              }
            },
          ),
          separatorBuilder: (context, index) => SizedBox(
            height: 16.0,
          ),
          itemCount: state.episodes?.length ?? 0,
        ),
      ),
    );
  }
}
