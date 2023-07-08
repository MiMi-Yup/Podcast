import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/common/widgets/m_episode_component_in_edit_view.dart';
import 'package:join_podcast/common/widgets/m_episode_component_with_event.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/channel/new_episode/createNewEpisode_route.dart';
import 'package:join_podcast/presentation/channel/new_podcast/editPodcast/cubit/editPodcast_cubit.dart';
import '../../../../record/list_record/list_record.dart';

class PodcastEditingScreen extends StatelessWidget {
  const PodcastEditingScreen({
    Key? key, // Thêm key vào đây
  }) : super(key: key); // Truyền key vào super constructor

  @override
  Widget build(BuildContext context) {
    context.read<EditPodcastCubit>().getPodcastForCreator();
    return Scaffold(body: BlocBuilder<EditPodcastCubit, EditPodcastState>(
        builder: (context, state) {
      return CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
        SliverAppBar(
          elevation: 0.0,
          floating: true,
          title: Text(MultiLanguage.of(context).podcast),
          actions: [
            IconButton(onPressed: null, icon: const Icon(Icons.share)),
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
              onSelected: (value) {
                switch (value) {
                  case 0:
                    // Xử lý sự kiện khi chọn Download All
                    break;
                  case 1:
                    // Xử lý sự kiện khi chọn Rename
                    break;
                  case 2:
                    // Xử lý sự kiện khi chọn Delete
                    context.read<EditPodcastCubit>().deletePodcast();
                    XMDRouter.pop();
                    break;
                  default:
                    // Xử lý sự kiện cho các giá trị khác (nếu cần)
                    break;
                }
              },
              icon: Icon(Icons.more_horiz),
            )
          ],
        ),
        SliverToBoxAdapter(
            child: Stack(alignment: Alignment.topCenter, children: [
          Container(
            color: Colors.green.shade900,
            height: 150,
          ),
          Padding(
            padding:
                EdgeInsets.only(left: mSpacing, right: mSpacing, top: mSpacing),
            child: BlocBuilder<EditPodcastCubit, EditPodcastState>(
              buildWhen: (previous, current) =>
                  previous.podcast != current.podcast,
              builder: (context, state) => Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (state.podcast?.image != null)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            state.podcast!.image!,
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      SizedBox(
                        height: mSpacing,
                      ),
                      Text(state.podcast?.name ?? '',
                          style: mST20M.copyWith(color: Colors.white)),
                    ],
                  ),
                  Column(
                    children: [
                      Text(state.podcast?.numListening?.toString() ?? '',
                          style: mST20M.copyWith(color: Colors.white)),
                      SizedBox(
                        height: mSpacing,
                      ),
                      Text("Lượt nghe",
                          style: mST16R.copyWith(color: Colors.white)),
                    ],
                  ),
                  Column(
                    children: [
                      Text(state.podcast?.count?.toString() ?? '',
                          style: mST20M.copyWith(color: Colors.white)),
                      SizedBox(
                        height: mSpacing,
                      ),
                      Text(MultiLanguage.of(context).episode,
                          style: mST16R.copyWith(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ])),
        SliverFillRemaining(
            hasScrollBody: true,
            child: state.episodes != null
                ? Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        color: Colors.grey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Your episodes",
                                style: mST16R.copyWith(color: Colors.black)),
                            ElevatedButton(
                              onPressed: () async {
                                // Xử lý sự kiện khi nút được nhấn
                                final nextStep =
                                    await XMDRouter.pushNamedForResult(
                                        routerIds[ListRecordRoute]!);
                                if (nextStep is bool && nextStep == true) {
                                  XMDRouter.pushNamedForResult(
                                      routerIds[CreateNewEpisodeRoute]!,
                                      arguments: {
                                        'idPodcast': context
                                            .read<EditPodcastCubit>()
                                            .idPodcast
                                      });
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                primary: Colors.transparent,
                                elevation: 0,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    "New",
                                    style: mST16R.copyWith(color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.add_circle,
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: List.generate(
                          state.episodes!.length,
                          (index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MEpisodeComponentWithEvent(
                                data: state.episodes![index],
                                listOption: [Text(MultiLanguage.of(context).edit), Text(MultiLanguage.of(context).delete)],
                                onMore: (index){
                                  switch (index) {
                                    case 2:
                                      
                                      break;
                                      case 3:
                                      
                                      break;
                                    default:
                                  }
                                },
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.library_music, size: 64.0),
                        SizedBox(height: 16.0),
                        Text(
                          'Không có episode nào',
                          style: TextStyle(fontSize: 16.0),
                        ),
                        SizedBox(height: 8.0),
                        ElevatedButton(
                          onPressed: () {
                            // TODO: Xử lý sự kiện nhấn nút tạo mới episode
                          },
                          child: Text('Hãy tạo mới episode'),
                        ),
                      ],
                    ),
                  ))
      ]);
    }));
  }
}

class Episode {
  final String title;
  final String description;

  Episode(this.title, this.description);
}
