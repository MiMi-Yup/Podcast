import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';

class MButtonSetting extends StatelessWidget {
  final void Function(bool?)? onPressed;
  final String title;
  final Widget? icon;
  final bool isSwitch;
  final bool initState;
  final String? subTitlte;
  const MButtonSetting(
      {super.key,
      this.onPressed,
      required this.title,
      this.icon,
      this.isSwitch = false,
      this.initState = false,
      this.subTitlte});

  @override
  Widget build(BuildContext context) {
    return isSwitch
        ? _MButtonSwitch(
            key: key,
            title: title,
            onPressed: onPressed,
            icon: icon,
            initState: initState)
        : _MButtonLabel(
            key: key,
            title: title,
            onPressed: onPressed,
            icon: icon,
            subTitlte: subTitlte);
  }
}

class _MButtonLabel extends StatelessWidget {
  final void Function(bool?)? onPressed;
  final String title;
  final String? subTitlte;
  final Widget? icon;
  const _MButtonLabel(
      {super.key,
      this.onPressed,
      required this.title,
      this.icon,
      this.subTitlte});

  Widget get renderTitle => subTitlte == null
      ? Text(title, style: mST16M)
      : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
              Text(title, style: mST16M),
              SizedBox(
                height: 8.0,
              ),
              Text(subTitlte!, style: mST14R)
            ]);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          foregroundColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
          elevation: 0.0,
          padding: const EdgeInsets.all(10.0)),
      onPressed: () {
        if (onPressed != null) onPressed!(null);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (icon != null) icon!,
              SizedBox(
                width: 10.0,
              ),
              renderTitle
            ],
          ),
          const Icon(Icons.keyboard_arrow_right)
        ],
      ),
    );
  }
}

class _MButtonSwitch extends StatelessWidget {
  final void Function(bool?)? onPressed;
  final String title;
  final Widget? icon;
  final bool initState;
  const _MButtonSwitch(
      {super.key,
      required this.title,
      this.onPressed,
      this.icon,
      required this.initState});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          foregroundColor: Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black,
          elevation: 0.0,
          padding: const EdgeInsets.all(10.0)),
      onPressed: () => onPressed != null ? onPressed!(!initState) : null,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (icon != null) icon!,
              SizedBox(
                width: 10.0,
              ),
              Text(
                title,
                style: mST16M,
              )
            ],
          ),
          Switch(value: initState, onChanged: onPressed)
        ],
      ),
    );
  }
}
