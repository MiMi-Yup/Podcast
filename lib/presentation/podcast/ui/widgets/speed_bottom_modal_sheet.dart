import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';

class SpeedChange extends StatefulWidget {
  final double speed;
  final Function(double) onSpeedChanged;
  const SpeedChange(
      {Key? key, required this.onSpeedChanged, required this.speed})
      : super(key: key);

  @override
  State<SpeedChange> createState() => _SpeedChangeState();
}

class _SpeedChangeState extends State<SpeedChange> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: widget.speed == 0.25
                  ? Icon(
                      Icons.check,
                      color: mCGreen500,
                      size: 24,
                    )
                  : const SizedBox(),
              title: const Text('0.25x'),
              onTap: () {
                setState(() {
                  widget.onSpeedChanged(0.25);
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: widget.speed == 0.5
                  ? Icon(
                      Icons.check,
                      color: mCGreen500,
                      size: 24,
                    )
                  : const SizedBox(),
              title: const Text('0.5x'),
              onTap: () {
                setState(() {
                  widget.onSpeedChanged(0.5);
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: widget.speed == 0.75
                  ? Icon(
                      Icons.check,
                      color: mCGreen500,
                      size: 24,
                    )
                  : const SizedBox(),
              title: const Text('0.75x'),
              onTap: () {
                setState(() {
                  widget.onSpeedChanged(0.75);
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: widget.speed == 1
                  ? Icon(
                      Icons.check,
                      color: mCGreen500,
                      size: 24,
                    )
                  : const SizedBox(),
              title: const Text('Bình thường'),
              onTap: () {
                setState(() {
                  widget.onSpeedChanged(1);
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: widget.speed == 1.25
                  ? Icon(
                      Icons.check,
                      color: mCGreen500,
                      size: 24,
                    )
                  : const SizedBox(),
              title: const Text('1.25x'),
              onTap: () {
                setState(() {
                  widget.onSpeedChanged(1.25);
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: widget.speed == 1.5
                  ? Icon(
                      Icons.check,
                      color: mCGreen500,
                      size: 24,
                    )
                  : const SizedBox(),
              title: const Text('1.5x'),
              onTap: () {
                setState(() {
                  widget.onSpeedChanged(1.5);
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: widget.speed == 1.75
                  ? Icon(
                      Icons.check,
                      color: mCGreen500,
                      size: 24,
                    )
                  : const SizedBox(),
              title: const Text('1.75x'),
              onTap: () {
                setState(() {
                  widget.onSpeedChanged(1.75);
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: widget.speed == 2
                  ? Icon(
                      Icons.check,
                      color: mCGreen500,
                      size: 24,
                    )
                  : const SizedBox(),
              title: const Text('2.0x'),
              onTap: () {
                setState(() {
                  widget.onSpeedChanged(2);
                  Navigator.pop(context);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
