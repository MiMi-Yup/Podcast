import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'dart:math' as math;

class MSection {
  Key? key;
  String? title;
  Color headerColor;
  Color titleColor;
  double? height;
  Widget content;
  bool headerPressable;
  Widget? action;
  void Function()? onPressed;
  AnimationController? controller;

  MSection(
      {this.key,
      this.title,
      this.headerColor = Colors.white,
      this.titleColor = Colors.black,
      required this.content,
      this.height,
      this.headerPressable = false,
      this.onPressed,
      this.action,
      this.controller});

  MultiSliver builder() {
    final header = Text(
      title ?? "",
      style: mST18M.copyWith(color: titleColor),
    );

    final _action = action == null
        ? controller == null
            ? null
            : AnimatedBuilder(
                animation: controller!,
                builder: (context, child) => Transform(
                      transform:
                          Matrix4.rotationZ(controller!.value * -math.pi),
                      alignment: FractionalOffset.center,
                      child: const Icon(Icons.keyboard_arrow_up),
                    ))
        : TextButton(onPressed: onPressed, child: action!);

    final structure = Container(
      color: headerColor,
      height: height ?? 50,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.all(10.0),
      child: title == null
          ? null
          : (action == null
              ? controller != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [header, _action!],
                    )
                  : header
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [header, _action!],
                )),
    );

    return MultiSliver(key: key, pushPinnedChildren: true, children: [
      SliverPinnedHeader(
          child: headerPressable
              ? GestureDetector(
                  onTap: onPressed,
                  child: structure,
                )
              : structure),
      content,
    ]);
  }
}
