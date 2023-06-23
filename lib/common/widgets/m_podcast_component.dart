import 'package:flutter/material.dart';

class PodcastComponent extends StatelessWidget {
  final String title;
  final String author;
  final String? networkImage;
  // Add other properties for the podcast component as needed

  const PodcastComponent({
    Key? key,
    required this.title,
    required this.author,
    required this.networkImage,
    // Pass other properties for the podcast component as needed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // TODO: Hiển thị thông tin của podcast
      title: Text(title),
      subtitle: Text(author),
      leading: CircleAvatar(
        // TODO: Ảnh đại diện cho podcast
      ),
      onTap: () {
        // TODO: Xử lý khi nhấn vào podcast
      },
    );
  }
}
