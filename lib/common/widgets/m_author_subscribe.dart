import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/style/style.dart';
import 'package:configuration/utility/constants/asset_constants.dart';
import 'package:flutter/material.dart';

class MAuthorSubscribe extends StatelessWidget {
  final String author;
  final int quantity;
  final String? networkImage;
  final void Function()? onPressed;
  final void Function(bool)? toggleSubscribe;
  const MAuthorSubscribe(
      {super.key,
      required this.author,
      required this.quantity,
      required this.networkImage,
      this.onPressed,
      this.toggleSubscribe});

  @override
  Widget build(BuildContext context) {
    bool isSubscribed = false;
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
            StatefulBuilder(builder: (context, setState) {
              return GestureDetector(
                onTap: () {
                  if (toggleSubscribe != null) {
                    toggleSubscribe!(!isSubscribed);
                  }
                  setState(() => isSubscribed = !isSubscribed);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: isSubscribed ? mCPrimary : Colors.transparent,
                      border: Border.all(
                          color: isSubscribed ? mCPrimary : Colors.blueGrey),
                      borderRadius: BorderRadius.circular(16.0)),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(isSubscribed ? Icons.check : Icons.add,
                          color: isSubscribed ||
                                  Theme.of(context).brightness ==
                                      Brightness.dark
                              ? Colors.white
                              : Colors.black),
                      const SizedBox(width: 4.0),
                      Text(
                          isSubscribed
                              ? MultiLanguage.of(context).subscribed
                              : MultiLanguage.of(context).subscribe,
                          style: mST16R.copyWith(
                              color: isSubscribed ||
                                      Theme.of(context).brightness ==
                                          Brightness.dark
                                  ? Colors.white
                                  : Colors.black))
                    ],
                  ),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
