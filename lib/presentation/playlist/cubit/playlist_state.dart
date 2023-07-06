part of 'playlist_cubit.dart';

@immutable
abstract class PlaylistState extends Equatable {}

class PlaylistStateInitial extends PlaylistState {
  final List<EpisodeModel> episodes;

  PlaylistStateInitial({required this.episodes});

  @override
  List<Object?> get props => [episodes];

  PlaylistStateInitial copyWith({List<EpisodeModel>? episodes}) {
    return PlaylistStateInitial(episodes: episodes ?? this.episodes);
  }
}
