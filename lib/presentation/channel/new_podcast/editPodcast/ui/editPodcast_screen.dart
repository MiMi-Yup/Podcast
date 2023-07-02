import 'package:blur/blur.dart';
import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:configuration/style/style.dart';
import 'package:configuration/utility/constants/asset_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/common/widgets/m_episode_component_in_edit_view.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/channel/new_channel/create_name_and_description/ui/createNameAndDescription_screen.dart';

import '../../../../../common/widgets/m_episode_component.dart';
import '../../../../record/list_record/list_record.dart';

class PodcastEditingScreen extends StatelessWidget {
  final String podcastName;
  final String? podcastImage;
  final int totalListens;
  final List<Episode> episodeList;

  PodcastEditingScreen({
    Key? key, // Thêm key vào đây
    required this.podcastName,
    required this.podcastImage,
    required this.totalListens,
    required this.episodeList,
  }) : super(key: key); // Truyền key vào super constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
        SliverAppBar(
          elevation: 0.0,
          floating: true,
          title: Text(MultiLanguage.of(context).podcast),
          actions: [
            IconButton(
                onPressed: null,
                icon: const Icon(Icons.share)),
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
              onSelected: null,
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
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        mAIntroduction1,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: mSpacing,
                    ),
                    Text("1", style: mST20M.copyWith(color: Colors.white)),
                  ],
                ),
                    SizedBox(width: mSpacing*6,),
                    Column(
                      children: [
                        Text("1", style: mST20M.copyWith(color: Colors.white)),
                        SizedBox(
                          height: mSpacing,
                        ),
                        Text("Lượt nghe",
                            style: mST16R.copyWith(color: Colors.white)),
                      ],
                    ),
                SizedBox(width: mSpacing*5,),
                    Column(
                      children: [
                        Text(episodeList.length.toString(), style: mST20M.copyWith(color: Colors.white)),
                        SizedBox(
                          height: mSpacing,
                        ),
                        Text("Số tập",
                            style: mST16R.copyWith(color: Colors.white)),
                      ],
                    ),
              ],
            ),
          )
        ])),
        SliverFillRemaining(
            hasScrollBody: true,
            child: episodeList.isNotEmpty
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
                              onPressed: () {
                                // Xử lý sự kiện khi nút được nhấn
                                XMDRouter.pushNamedForResult(routerIds[ListRecordRoute]!);
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
                                  Icon(Icons.add_circle, color: Colors.black,),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Column(
                        children: List.generate(
                          episodeList.length,
                          (index) {
                            final episode = episodeList[index];
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: MEpisodeComponentForEdit(
                                title: episode.title,
                                duration: Duration(minutes: 52, seconds: 25),
                                networkImage: null, dateCreated: DateTime(2023,5,17),
                              ),
                            );
                          },
                        ),
                      ),
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
                  )),
      ]),
    );
  }
}

class Episode {
  final String title;
  final String description;

  Episode(this.title, this.description);
}
