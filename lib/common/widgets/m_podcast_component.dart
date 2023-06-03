import 'package:configuration/style/style.dart';
import 'package:configuration/utility/constants/asset_constants.dart';
import 'package:flutter/material.dart';

class MPodcastComponent extends StatefulWidget {
  final String title;
  final String author;
  final Duration duration;
  final String? networkImage;
  final bool isCompleted;
  final bool isPlayed;
  final bool isDownloaded;
  final bool Function(bool)? onPlay;
  final bool Function(bool)? onDownload;
  final void Function(int)? onMore;
  final void Function()? onPressed;
  const MPodcastComponent(
      {super.key,
      required this.title,
      required this.author,
      required this.duration,
      required this.networkImage,
      this.onPlay,
      this.onDownload,
      this.onMore,
      this.onPressed,
      this.isPlayed = false,
      this.isDownloaded = false,
      this.isCompleted = false});

  @override
  State<MPodcastComponent> createState() => _MPodcastComponentState();
}

class _MPodcastComponentState extends State<MPodcastComponent> {
  late bool isPlayed;
  late bool isDownloaded;

  @override
  void initState() {
    super.initState();
    isPlayed = widget.isPlayed;
    isDownloaded = widget.isDownloaded;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125.0,
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Row(
          children: [
            Container(
              width: 125,
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(20.0),
                  image: widget.networkImage == null
                      ? DecorationImage(
                          image: AssetImage(mAIntroduction1),
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover)
                      : DecorationImage(
                          image: NetworkImage(widget.networkImage!, scale: 1.0),
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
                    widget.title,
                    maxLines: 2,
                    softWrap: true,
                    style: mST18M,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "${widget.author} | ${widget.duration.inMinutes.remainder(60)}:${widget.duration.inSeconds.remainder(60)} mins",
                    style: mST14R,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Row(
                        children: [
                          if (widget.isCompleted)
                            Container(
                              height: 38.0,
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: mCPrimary,
                                      strokeAlign: BorderSide.strokeAlignCenter,
                                      width: 2.0),
                                  borderRadius: BorderRadius.circular(50.0)),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.play_arrow,
                                    color: mCPrimary,
                                  ),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Text("Completed", style: mST14M)
                                ],
                              ),
                            )
                          else
                            Container(
                              height: 38.0,
                              padding: EdgeInsets.only(left: 4.0, right: 4.0),
                              decoration: BoxDecoration(
                                  color: isPlayed ? mCWarning : mCPrimary,
                                  borderRadius: BorderRadius.circular(50.0)),
                              child: TextButton(
                                  onPressed: () {
                                    if (widget.onPlay != null) {
                                      final state = widget.onPlay!(isPlayed);
                                      if (state != isPlayed) {
                                        setState(() => isPlayed = state);
                                      }
                                    }
                                  },
                                  child: Row(
                                    children: [
                                      Icon(
                                        isPlayed
                                            ? Icons.pause
                                            : Icons.play_arrow,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      Text(isPlayed ? "Pause" : "Play",
                                          style: mST14M.copyWith(
                                              color: Colors.white))
                                    ],
                                  )),
                            ),
                          IconButton(
                              onPressed: () {
                                if (widget.onDownload != null) {
                                  final state =
                                      widget.onDownload!(isDownloaded);
                                  if (state != isDownloaded) {
                                    setState(() => isDownloaded = state);
                                  }
                                }
                              },
                              icon: Icon(isDownloaded
                                  ? Icons.download_done
                                  : Icons.download_for_offline_outlined))
                        ],
                      )),
                      PopupMenuButton<int>(
                        icon: Icon(Icons.more_vert),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            value: 0,
                            child: Text('Edit'),
                          ),
                          PopupMenuItem(
                            value: 1,
                            child: Text('Delete'),
                          )
                        ],
                        onSelected: widget.onMore,
                      )
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
