part of 'library_cubit.dart';

@immutable
class LibraryState extends Equatable {
  final List<EpisodeModel> favourites;
  final List<PlaylistModel> playlists;

  const LibraryState(
      {required this.favourites, required this.playlists});

  factory LibraryState.initial() =>
      const LibraryState(favourites: [], playlists: []);

  @override
  List<Object?> get props => [favourites, playlists];

  LibraryState copyWith(
      {List<EpisodeModel>? favourites, List<PlaylistModel>? playlists}) {
    return LibraryState(
        favourites: favourites ?? this.favourites,
        playlists: playlists ?? this.playlists);
  }
}
