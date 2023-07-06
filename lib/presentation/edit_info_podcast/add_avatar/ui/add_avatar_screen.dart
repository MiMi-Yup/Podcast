import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';

class AddAvatarScreen extends StatefulWidget {
  const AddAvatarScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AddAvatarScreen> createState() => _AddAvatarScreen();
}

class _AddAvatarScreen extends State<AddAvatarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        centerTitle: true,
        title: Text(
          "Search for a photo",
          style: mST20R.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
        child: Column(
          children: [
            Wrap(
              children: const [
                Text(
                  'This search is powered by Unsplash, whichoffers beautiful images completely free!',
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: mST16R,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              textAlignVertical: TextAlignVertical.center,
              decoration: const InputDecoration(
                hintText: 'Search for any keyword or phrase',
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: List.generate(10, (index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image: NetworkImage(
                              "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg"),
                          fit: BoxFit.cover),
                    ),
                    //Dòng dưới này nên comment lại, dùng minh họa
                    child: Center(
                      child: Text(
                        'Hình ảnh $index',
                        style: mST18R.copyWith(color: Colors.white),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
