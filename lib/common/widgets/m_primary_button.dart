import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';

class MPrimaryButton extends StatelessWidget {
  final Color textColor;
  final Color background;
  final String text;
  final TextStyle? style;
  final void Function()? onPressed;
  final double borderRadius;

  const MPrimaryButton(
      {super.key,
      this.textColor = Colors.white,
      this.background = Colors.purple,
      required this.text,
      this.style,
      required this.onPressed,
      this.borderRadius = 32.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          boxShadow: [
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
          child: Text(text,
              style: style ?? mST20M.copyWith(color: Colors.white))),
    );
  }
}
