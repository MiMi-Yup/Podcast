import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/style/style.dart';
import 'package:configuration/utility/constants/asset_constants.dart';
import 'package:flutter/material.dart';
import 'package:join_podcast/common/widgets/m_toggle.dart';

class MEpisodeComponent extends StatefulWidget {
  final String title;
  final String author;
  final Duration duration;
  final String? networkImage;
  final bool isCompleted;
  final bool isPlayed;
  final bool isDownloaded;
  final bool isAdmin;
  final bool Function(bool)? onPlay;
  final bool Function(bool)? onDownload;
  final void Function(int)? onMore;
  final void Function()? onPressed;
  final void Function()? onAvatarPressed;
  final List<Widget> listOption;
  const MEpisodeComponent(
      {super.key,
      required this.title,
      required this.author,
      required this.duration,
      required this.networkImage,
      this.onPlay,
      this.onDownload,
      this.onMore,
      this.onPressed,
      this.onAvatarPressed,
      this.isPlayed = false,
      this.isDownloaded = false,
      this.isCompleted = false,
      this.isAdmin = false,
      this.listOption = const []});

  @override
  State<MEpisodeComponent> createState() => _MEpisodeComponentState();
}

class _MEpisodeComponentState extends State<MEpisodeComponent> {
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
        behavior: HitTestBehavior.translucent,
        child: Row(
          children: [
            GestureDetector(
              onTap: widget.onAvatarPressed,
              child: Container(
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
                            image:
                                NetworkImage(widget.networkImage!, scale: 1.0),
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover)),
              ),
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
                          Container(
                              height: 38.0,
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                  color: isPlayed ? mCWarning : mCPrimary,
                                  borderRadius: BorderRadius.circular(50.0)),
                              child: MToggle(
                                  initState: isPlayed,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.play_arrow,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      Text(MultiLanguage.of(context).play,
                                          style: mST14M.copyWith(
                                              color: Colors.white))
                                    ],
                                  ),
                                  whenTrue: Row(
                                    children: [
                                      Icon(
                                        Icons.pause,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      Text(MultiLanguage.of(context).pause,
                                          style: mST14M.copyWith(
                                              color: Colors.white))
                                    ],
                                  ),
                                  onToogle: widget.onPlay)),
                          SizedBox(
                            width: 8.0,
                          ),
                          MToggle(
                            child: Icon(Icons.download_for_offline_outlined),
                            whenTrue: Icon(Icons.download_done),
                            initState: isDownloaded,
                            onToogle: widget.onDownload,
                          )
                        ],
                      )),
                      if (widget.isAdmin)
                        PopupMenuButton<int>(
                          icon: Icon(Icons.more_vert),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          itemBuilder: (context) => widget.listOption
                              .asMap()
                              .entries
                              .map((e) =>
                                  PopupMenuItem(value: e.key, child: e.value))
                              .toList(),
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
