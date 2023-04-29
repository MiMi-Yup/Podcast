import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';

class MSecondaryButton extends StatelessWidget {
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final double? borderRadius;
  final Widget child;
  final Color? background;
  final void Function()? onTap;
  const MSecondaryButton(
      {super.key,
      required this.child,
      required this.onTap,
      this.background,
      this.padding,
      this.margin,
      this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: background,
            border: Border.all(color: Colors.grey.withAlpha(50)),
            borderRadius: BorderRadius.circular(borderRadius ?? mPadding)),
        padding: padding,
        margin: margin,
        child: child,
      ),
    );
  }
}
