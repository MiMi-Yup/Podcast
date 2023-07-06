import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/style/style.dart';
import 'package:configuration/utility/constants/asset_constants.dart';
import 'package:flutter/material.dart';

class PodcastComponent extends StatefulWidget {
  final String title;
  final String author;
  final String? networkImage;
  final int episodes;
  final int listens;
  final void Function(int)? onMore;
  final void Function()? onPressed;
  // Add other properties for the podcast component as needed

  const PodcastComponent({
    Key? key,
    required this.title,
    required this.author,
    required this.networkImage,
    required this.episodes,
    required this.listens,
    this.onMore,
    this.onPressed,
    // Pass other properties for the podcast component as needed
  }) : super(key: key);

  @override
  State<PodcastComponent> createState() => _PodcastComponent();
}

class _PodcastComponent extends State<PodcastComponent> {

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
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.title,
                        maxLines: 2,
                        softWrap: true,
                        style: mST18M,
                        overflow: TextOverflow.ellipsis,
                      ),
                      PopupMenuButton<int>(
                        icon: Icon(Icons.more_vert),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10))),
                        itemBuilder: (context) => [
                          /* PopupMenuItem(
                                value: 0,
                                child: Text(MultiLanguage.of(context).channel),
                              ),
                              PopupMenuItem(
                                value: 1,
                                child: Text(MultiLanguage.of(context).edit),
                              ),*/
                          PopupMenuItem(
                            value: 2,
                            child: Text(MultiLanguage.of(context).delete),
                          )
                        ],
                        onSelected: widget.onMore,
                      ),
                    ],
                  ),
                  Text(
                    widget.author,
                    style: mST16R,
                  ),
                  Text(
                    "${widget.episodes} Episodes | ${widget.listens} Listens",
                    style: mST14R,
                  ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

