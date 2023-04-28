import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';

class MPrimaryButton extends StatelessWidget {
  final Color textColor;
  final Color background;
  final String text;
  final TextStyle? style;
  final void Function()? onPressed;
  final double borderRadius;
  final bool isShadow;

  const MPrimaryButton(
      {super.key,
      this.textColor = Colors.white,
      this.background = const Color.fromARGB(255, 150, 16, 255),
      required this.text,
      this.style = mST20M,
      required this.onPressed,
      this.borderRadius = 32.0,
      this.isShadow = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
            if (isShadow)
              BoxShadow(
                  color: background.withOpacity(0.6),
                  blurRadius: 5,
                  offset: const Offset(0, 4))
          ]),
      child: FilledButton(
          onPressed: onPressed,
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(borderRadius))),
              backgroundColor: MaterialStateProperty.all(background)),
          child:
              Text(text, style: style?.copyWith(color: textColor) ?? mST20M)),
    );
  }
}
