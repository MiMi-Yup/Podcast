import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';

class MButtonSetting extends StatelessWidget {
  final void Function(bool?)? onPressed;
  final String title;
  final Widget? icon;
  final bool isSwitch;
  final bool initState;
  const MButtonSetting(
      {super.key,
      this.onPressed,
      required this.title,
      this.icon,
      this.isSwitch = false,
      this.initState = false});

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
            key: key, title: title, onPressed: onPressed, icon: icon);
  }
}

class _MButtonLabel extends StatelessWidget {
  final void Function(bool?)? onPressed;
  final String title;
  final Widget? icon;
  const _MButtonLabel(
      {super.key, this.onPressed, required this.title, this.icon});

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
              Text(
                title,
                style: mST16M,
              )
            ],
          ),
          const Icon(Icons.keyboard_arrow_right)
        ],
      ),
    );
  }
}

class _MButtonSwitch extends StatefulWidget {
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
  State<_MButtonSwitch> createState() => __MButtonSwitchState();
}

class __MButtonSwitchState extends State<_MButtonSwitch> {
  late bool _initState;

  @override
  void initState() {
    super.initState();
    _initState = widget.initState;
  }

  void toogleState(bool newState) {
    setState(() => _initState = newState);
    if (widget.onPressed != null) widget.onPressed!(newState);
  }

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
      onPressed: () => toogleState(!_initState),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (widget.icon != null) widget.icon!,
              SizedBox(
                width: 10.0,
              ),
              Text(
                widget.title,
                style: mST16M,
              )
            ],
          ),
          Switch(value: _initState, onChanged: toogleState)
        ],
      ),
    );
  }
}
