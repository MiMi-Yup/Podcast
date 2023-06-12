import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';
import 'package:join_podcast/common/widgets/m_Author.dart';
import 'package:join_podcast/common/widgets/m_podcast_component.dart';
import 'package:join_podcast/common/widgets/m_section.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/episode/episode_route.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:expandable_text/expandable_text.dart';

class CreateNameAndDescriptionScreen extends StatelessWidget {
  const CreateNameAndDescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quản lý kênh'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Phần thông tin người dùng
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  // TODO: Avatar của người dùng
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TODO: Tên người dùng
                    Text('Tên người dùng'),
                    SizedBox(height: 8),
                    // TODO: Số podcast
                    Text('Số podcast'),
                    SizedBox(height: 4),
                    // TODO: Số lượt nghe
                    Text('Số lượt nghe'),
                  ],
                ),
              ],
            ),
          ),
          Divider(),
          // Danh sách các podcast đã tạo
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Các podcast đã tạo',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 16),
                // TODO: List các podcast item
                PodcastItem(
                  // TODO: Truyền các giá trị của podcast vào đây
                ),
                // TODO: Thêm các PodcastItem khác vào đây
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Xử lý khi nhấn nút tạo podcast
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class PodcastItem extends StatelessWidget {
  // TODO: Khai báo các thuộc tính cần thiết cho podcast

  PodcastItem
  (
      {super.key,
      // TODO: Truyền các giá trị của podcast vào đây
      }
  );


@override
Widget build(BuildContext context) {
  return ListTile(
    // TODO: Hiển thị thông tin của podcast
    title: Text('Tên podcast'),
    subtitle: Text('Mô tả podcast'),
    leading: CircleAvatar(
      // TODO: Ảnh đại diện cho podcast
    ),
    onTap: () {
      // TODO: Xử lý khi nhấn vào podcast
    },
  );
}
}

