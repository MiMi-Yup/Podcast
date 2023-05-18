import 'package:flutter/material.dart';

class PlayStopButton extends StatefulWidget {
  @override
  _PlayStopButtonState createState() => _PlayStopButtonState();
}

class _PlayStopButtonState extends State<PlayStopButton> {
  bool isPlaying = false;

  void togglePlayStop() {
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: togglePlayStop,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Colors.green.shade600,
          shape: BoxShape.circle,
        ),
        child: Icon(
          isPlaying ? Icons.pause : Icons.play_arrow,
          size: 36,
          color: Colors.white,
        ),
      ),
    );
  }
}
