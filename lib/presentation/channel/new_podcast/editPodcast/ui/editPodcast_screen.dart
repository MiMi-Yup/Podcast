import 'package:blur/blur.dart';
import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:configuration/style/style.dart';
import 'package:configuration/utility/constants/asset_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/presentation/channel/new_channel/create_name_and_description/ui/createNameAndDescription_screen.dart';

import '../../../../../common/widgets/m_episode_component.dart';

class PodcastEditingScreen extends StatelessWidget {
  final String podcastName;
  final String? podcastImage;
  final int totalListens;
  final List<Episode>? episodeList;

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
              onSelected: null,
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
                Text("Podcast Ngày buồn",
                    style: mST20M.copyWith(color: Colors.white)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 180,
                      child: GridView.count(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        childAspectRatio: 3,
                        padding: EdgeInsets.all(mSpacing),
                        children: [
                          Text(
                            "360 ${MultiLanguage.of(context).episode}",
                            style: mST14M.copyWith(color: Colors.white),
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
                                Text("3h 20p",
                                    style: mST14M.copyWith(color: Colors.white))
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
                              Text("13",
                                  style: mST14M.copyWith(color: Colors.white))
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
                              Text("64",
                                  style: mST14M.copyWith(color: Colors.white))
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
                          onPressed: null,
                          child: Row(
                            children: [
                              Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 8.0,
                              ),
                              Text(MultiLanguage.of(context).shufflePlay,
                                  style: mST14M.copyWith(color: Colors.white))
                            ],
                          )),
                    ),
                  ],
                )
              ],
            ),
          )
        ])),
        SliverFillRemaining(
            hasScrollBody: true,
            child: podcastList.isNotEmpty
                ? Column(
              children: List.generate(
                podcastList.length,
                    (index) {
                  final podcast = podcastList[index];
                  return ListTile(
                    title: Text(podcast.title),
                  );
                },
              ),
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
