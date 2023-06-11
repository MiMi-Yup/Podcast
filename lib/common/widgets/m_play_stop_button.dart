import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class PlayStopButton extends StatelessWidget {
  const PlayStopButton({
    Key? key,
    required this.audioPlayer,
  }) : super(key: key);

  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
      stream: audioPlayer.playerStateStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final playerState = snapshot.data;
          final processingState = playerState!.processingState;

          if (processingState == ProcessingState.loading ||
              processingState == ProcessingState.buffering) {
            return Container(
              width: 60,
              height: 60,
              margin: const EdgeInsets.all(10.0),
              child: const CircularProgressIndicator(),
            );
          } else if (!audioPlayer.playing) {
            return InkWell(
              onTap: audioPlayer.play,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.green.shade600,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.play_arrow,
                  size: 36,
                  color: Colors.white,
                ),
              ),
            );
          } else if (processingState != ProcessingState.completed) {
            return InkWell(
              onTap: audioPlayer.pause,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.green.shade600,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.pause,
                  size: 36,
                  color: Colors.white,
                ),
              ),
            );
          } else {
            return InkWell(
              onTap: () => audioPlayer.seek(
                Duration.zero,
                index: audioPlayer.effectiveIndices!.first,
              ),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.green.shade600,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.replay,
                  size: 36,
                  color: Colors.white,
                ),
              ),
            );
          }
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
