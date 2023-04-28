import 'package:configuration/style/style.dart';
import 'package:configuration/utility/constants/asset_constants.dart';
import 'package:flutter/material.dart';

class MAuthorFull extends StatelessWidget {
  final String author;
  final int quantity;
  final String? networkImage;
  final void Function()? onPressed;
  final void Function(int)? onMore;
  const MAuthorFull(
      {super.key,
      required this.author,
      required this.quantity,
      required this.networkImage,
      this.onPressed,
      this.onMore});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125.0,
      child: GestureDetector(
        onTap: onPressed,
        child: Row(
          children: [
            Expanded(
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          author,
                          maxLines: 1,
                          softWrap: true,
                          style: mST18M,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          "${quantity} podcasts",
                          style: mST14R,
                        ),
                      ]),
                )
              ],
            )),
            IconButton(onPressed: () => onMore, icon: Icon(Icons.more_vert))
          ],
        ),
      ),
    );
  }
}
