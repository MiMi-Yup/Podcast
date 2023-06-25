import 'package:configuration/route/xmd_router.dart';
import 'package:configuration/style/style.dart';
import 'package:configuration/utility/constants/asset_constants.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/m_episode_component.dart';

class PodcastEditingScreen extends StatelessWidget {
  final String podcastName;
  final String? podcastImage;
  final int totalListens;
  final List<Episode> episodeList;

  PodcastEditingScreen({super.key,
    required this.podcastName,
    required this.podcastImage,
    required this.totalListens,
    required this.episodeList,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chỉnh sửa Podcast'),
        actions: [
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {
              // TODO: Xử lý sự kiện nhấn nút chia sẻ
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              _showModalBottomSheet(context);
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 125,
                      height: 125,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(20.0),
                          image: podcastImage == null
                              ? DecorationImage(
                                  image: AssetImage(mAIntroduction1),
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.cover)
                              : DecorationImage(
                                  image:
                                      NetworkImage(podcastImage!, scale: 1.0),
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.cover)),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      podcastName,
                      style: mST20M,
                    ),
                    // SizedBox(height: 8.0),
                  ],
                ),
                SizedBox(
                  width: 26,
                ),
                Column(
                  children: [
                    Text(
                      totalListens.toString(),
                      style: mST16R,
                    ),
                    Text(
                      'Tổng số lượt nghe',
                      style: mST16R,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My episodes',
                  style: mST16R,
                ),
                Text(
                  'New',
                  style: mST16R,
                ),
              ],
            ),
          ),
          Expanded(
            child: episodeList.isNotEmpty
                ? ListView.separated(
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
                  ),
          ),
        ],
      ),
    );
  }

  void _showModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Wrap(
            children: [
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Chỉnh sửa thông tin'),
                onTap: () {
                  // TODO: Xử lý sự kiện nhấn vào nút chỉnh sửa thông tin
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.delete),
                title: Text('Xóa podcast'),
                onTap: () {
                  // TODO: Xử lý sự kiện nhấn vào nút xóa podcast
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class Episode {
  final String title;
  final String description;

  Episode(this.title, this.description);
}
