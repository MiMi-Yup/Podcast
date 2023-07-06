class Song {
  final String title;
  final String description;
  final String url;

  Song({
    required this.title,
    required this.description,
    required this.url,
  });

  static List<Song> songs = [
    Song(
      title: 'Glass',
      description: 'Glass',
      url: 'assets/audio/glass.mp3',
    ),
    Song(
      title: 'Illusions',
      description: 'Illusions',
      url: 'assets/audio/illusions.mp3',
    ),
    Song(
      title: 'Pray',
      description: 'Pray',
      url: 'assets/audio/assets_music_pray.mp3',
    )
  ];
}
