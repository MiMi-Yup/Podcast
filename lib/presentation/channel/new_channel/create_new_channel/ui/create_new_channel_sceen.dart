import 'package:configuration/utility/constants/asset_constants.dart';
import 'package:flutter/material.dart';

class CreateNewChannelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Channel'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80.0,
              backgroundImage: AssetImage(mAIntroduction1),
            ),
            SizedBox(height: 20.0),
            Text(
              'Enter Channel Name:',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Channel Name',
                ),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                // TODO: Xử lý sự kiện khi nhấn nút Create Channel
              },
              child: Text('Create Channel'),
            ),
          ],
        ),
      ),
    );
  }
}