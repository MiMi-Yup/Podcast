import 'package:configuration/route/xmd_router.dart';
import 'package:configuration/utility/constants/asset_constants.dart';
import 'package:flutter/material.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/channel/new_podcast/editPodcast/editPodcast_route.dart';

import '../../../../../common/widgets/m_podcast_component.dart';
import '../../../new_podcast/createNewPodcast/createNewPodcast_route.dart';

class Podcast {
  final String title;
  final String description;
  final String imageUrl;

  Podcast(this.title, this.description, this.imageUrl);
}
List<Podcast> podcastList = [
  Podcast('Podcast 1', 'Description 1', 'Image URL 1'),
  Podcast('Podcast 2', 'Description 2', 'Image URL 2'),
  Podcast('Podcast 3', 'Description 3', 'Image URL 3'),
];
class CreateNameAndDescriptionScreen extends StatelessWidget {
  const CreateNameAndDescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: Text('Quản lý kênh'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(mAIntroduction1),
                        radius: 40,
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'username',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text('null Podcasts • null Listens'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'My Podcasts',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding:
              EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0),
              itemBuilder: (context, index) {
                Podcast podcast = podcastList[index];
                return PodcastComponent(
                  title: podcast.title,
                  author: podcast.description,
                  networkImage: null/*podcast.imageUrl*/,
                  episodes: 0,
                  listens: 0,
                  onPressed: () => XMDRouter.pushNamed(
                      routerIds[EditPodcastRoute]!,
                      arguments: {index: index}),
                  // Truyền các giá trị cần thiết vào component podcast
                );
              }, separatorBuilder: (BuildContext context, int index) => SizedBox(
              height: 16.0,
            ), itemCount: podcastList.length,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle create podcast button pressed
          XMDRouter.pushNamed(routerIds[CreateNewPodcastRoute]!);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
