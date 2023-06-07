part of 'library_cubit.dart';

@immutable
abstract class LibraryState extends Equatable {}

class LibraryStateFavourite extends LibraryState {
  final List<dynamic> favourites;
  final List<dynamic> playlists;

  LibraryStateFavourite({required this.favourites, required this.playlists});

  factory LibraryStateFavourite.initial() =>
      LibraryStateFavourite(favourites: [], playlists: []);

  @override
  List<Object?> get props => [favourites, playlists];

  LibraryStateFavourite copyWith(
      {List<dynamic>? favourites, List<dynamic>? playlists}) {
    return LibraryStateFavourite(
        favourites: favourites ?? this.favourites,
        playlists: playlists ?? this.playlists);
  }
}
