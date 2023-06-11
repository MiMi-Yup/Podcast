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
      url: 'assets/audio/134_-_The_Onead9d4.mp3',
    ),
    Song(
      title: 'Illusions',
      description: 'Illusions',
      url:
          'assets/audio/136_-_Repetition_or_freedom_-_Towards_Conscious_Attention71rpd.mp3',
    ),
    Song(
      title: 'Pray',
      description: 'Pray',
      url: 'assets/audio/138_-_Seeking62xxz.mp3',
    )
  ];
}
