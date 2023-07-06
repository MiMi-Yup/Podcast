import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';

class AddTextAvatarScreen extends StatefulWidget {
  const AddTextAvatarScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AddTextAvatarScreen> createState() => _AddTextAvatarScreen();
}

class _AddTextAvatarScreen extends State<AddTextAvatarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Add Text',
          style: mST20R.copyWith(fontWeight: FontWeight.w500),
        ),
        elevation: 1.0,
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
