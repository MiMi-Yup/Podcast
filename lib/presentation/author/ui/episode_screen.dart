import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';
import 'package:join_podcast/common/widgets/m_Author.dart';

class EpisodeScreen extends StatelessWidget {
  final int ordinalNumber;
  final String title;
  final String author;
  final Duration duration;
  final String? networkImage;
  final void Function()? onPlay;
  final void Function()? onPlaylist;
  final void Function(int)? onMore;
  final void Function()? onDownload;
  const EpisodeScreen({
    super.key,
    required this.ordinalNumber,
    required this.title,
    required this.author,
    required this.duration,
    required this.networkImage,
    this.onPlay,
    this.onPlaylist,
    this.onMore,
    this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
    double c_width = MediaQuery.of(context).size.width * 0.9;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Episode $ordinalNumber'),
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
                    Icon(Icons.report),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(MultiLanguage.of(context).report)
                  ],
                ),
              )
            ],
            offset: Offset(0, 50),
            onSelected: null,
          )
        ],
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPadding(
              padding: const EdgeInsets.all(10.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  Wrap(
                    direction: Axis.vertical,
                    spacing: 20,
                    children: [
                      SizedBox(
                        height: 125.0,
                        child: Row(
                          children: [
                            const MAuthor(networkImage: null),
                            const SizedBox(
                              width: 10.0,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: c_width - 125,
                                  child: Text(
                                    "${title}",
                                    style: mST18M.copyWith(
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                                SizedBox(
                                  width: (c_width - 125) * 0.6,
                                  child: Text(
                                    "${author}",
                                    style: mST16R.copyWith(
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        onPressed: () => {},
                                        icon: const Icon(Icons.circle)),
                                    IconButton(
                                        onPressed: () => {},
                                        icon: const Icon(Icons.share))
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      Text(
                          "${author}   |   ${duration.inMinutes.remainder(60)} : ${duration.inSeconds.remainder(60)} mins",
                          style: mST16R),
                      Container(
                        width: c_width,
                        child: Text(
                          "${ordinalNumber}: ${title}",
                          maxLines: 2,
                          softWrap: true,
                          style: mST24M,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Wrap(
                            spacing: 15,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Container(
                                height: 38.0,
                                padding: EdgeInsets.only(left: 4.0, right: 4.0),
                                decoration: BoxDecoration(
                                    color: mCPrimary,
                                    borderRadius: BorderRadius.circular(50.0)),
                                child: TextButton(
                                    onPressed: () => onPlay,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.play_arrow,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 8.0,
                                        ),
                                        Text("Play",
                                            style: mST14M.copyWith(
                                                color: Colors.white))
                                      ],
                                    )),
                              ),
                              IconButton(
                                  onPressed: () => onPlaylist,
                                  icon: Icon(Icons.playlist_add)),
                              IconButton(
                                  onPressed: () => onDownload,
                                  icon: Icon(
                                      Icons.download_for_offline_outlined)),
                            ],
                          ),
                          SizedBox(
                            width: 100,
                          ),
                          IconButton(
                              onPressed: () => onMore,
                              icon: Icon(Icons.more_vert))
                        ],
                      ),
                      Text(
                        "About it:",
                        style: textTitleStyleH2,
                      ),
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width - 30,
                          child: Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum \n \n Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum \n \n Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
                            style: mST14R.copyWith(
                              height: 1.5,
                            ),
                            softWrap: true,
                          ),
                        ),
                      )
                    ],
                  )
                ]),
              ))
        ],
      ),
    );
  }
}
