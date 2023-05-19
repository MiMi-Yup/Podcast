import 'package:configuration/style/style.dart';
import 'package:configuration/utility/constants/asset_constants.dart';
import 'package:flutter/material.dart';

class MPodcastComponent extends StatelessWidget {
  final String title;
  final String author;
  final Duration duration;
  final String? networkImage;
  final void Function()? onPlay;
  final void Function()? onPlaylist;
  final void Function()? onDownload;
  final void Function(int)? onMore;
  final void Function()? onPressed;
  const MPodcastComponent(
      {super.key,
      required this.title,
      required this.author,
      required this.duration,
      required this.networkImage,
      this.onPlay,
      this.onPlaylist,
      this.onDownload,
      this.onMore,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125.0,
      child: GestureDetector(
        onTap: onPressed,
        child: Row(
          children: [
            Container(
              width: 125,
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(20.0),
                  image: networkImage == null
                      ? DecorationImage(
                          image: AssetImage(mAIntroduction1),
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover)
                      : DecorationImage(
                          image: NetworkImage(networkImage!, scale: 1.0),
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover)),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    maxLines: 2,
                    softWrap: true,
                    style: mST18M,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "${author} | ${duration.inMinutes.remainder(60)}:${duration.inSeconds.remainder(60)} mins",
                    style: mST14R,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Row(
                        children: [
                          Container(
                            height: 38.0,
                            padding: EdgeInsets.only(left: 4.0, right: 4.0),
                            decoration: BoxDecoration(
                                color: mCPrimary,
                                borderRadius: BorderRadius.circular(50.0)),
                            child: TextButton(
                                onPressed: onPlay,
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
                              onPressed: onPlaylist,
                              icon: Icon(Icons.playlist_add)),
                          IconButton(
                              onPressed: onDownload,
                              icon: Icon(Icons.download_for_offline_outlined))
                        ],
                      )),
                      IconButton(
                          onPressed: () => onMore, icon: Icon(Icons.more_vert))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
