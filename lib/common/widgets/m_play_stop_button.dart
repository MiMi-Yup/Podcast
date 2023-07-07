import 'package:flutter/material.dart';
import 'package:join_podcast/data/data_source/runtime/player_storage_service.dart';
import 'package:just_audio/just_audio.dart';

class PlayStopButton extends StatelessWidget {
  final EpisodePlayerManager episodePlayerManager;
  const PlayStopButton({
    Key? key,
    required this.episodePlayerManager,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PlayerState>(
      stream: episodePlayerManager.audioPlayer.playerStateStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final playerState = snapshot.data;
          final processingState = playerState!.processingState;

          if (processingState == ProcessingState.loading ||
              processingState == ProcessingState.buffering) {
            return const SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(),
            );
          } else if (!episodePlayerManager.audioPlayer.playing) {
            return GestureDetector(
              onTap: episodePlayerManager.play,
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
            return GestureDetector(
              onTap: episodePlayerManager.pause,
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
            return GestureDetector(
              onTap: episodePlayerManager.replay,
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
