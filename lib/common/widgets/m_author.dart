import 'package:configuration/utility/constants/asset_constants.dart';
import 'package:flutter/material.dart';

class MAuthor extends StatelessWidget {
  final String? networkImage;
  final double? width;
  final double? height;
  final void Function()? onPressed;
  const MAuthor(
      {super.key,
      required this.networkImage,
      this.onPressed,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          width: width ?? 125.0,
          height: height ?? 125.0,
          decoration: BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.circular(30.0),
              image: networkImage == null
                  ? const DecorationImage(
                      image: AssetImage(mAIntroduction1),
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover)
                  : DecorationImage(
                      image: NetworkImage(networkImage!, scale: 1.0),
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover))),
    );
  }
}
