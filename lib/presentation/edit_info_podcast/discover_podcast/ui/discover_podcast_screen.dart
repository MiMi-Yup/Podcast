import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';

const listCategory = [
  "Khoa học và công nghệ",
  "Âm nhạc",
  "Thể thao",
  "Kinh doanh và sự nghiệp",
  "Sức khỏe và thể hình",
  "Lịch sử và văn hóa",
  "Hài kịch và giải trí",
  "Truyền thông xã hội",
  "Du lịch và khám phá",
  "Đời sống",
];
const listLanguage = [
  "Vietnamese",
  "Amoy",
  "Burmese",
  "Cantonese",
  "Chinese",
  "Braille",
  "Esperanto",
  "Latin",
  "Phonetic",
  "Korean",
  "Laotian",
  "Malayalam",
  "Malay",
  "Marathi",
  "India",
  "Marshallese",
  "Nepali",
];

class DiscoverPodcastScreen extends StatefulWidget {
  const DiscoverPodcastScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DiscoverPodcastScreen> createState() => _DiscoverPodcastScreen();
}

class _DiscoverPodcastScreen extends State<DiscoverPodcastScreen> {
  String selectedCategory = listCategory[0];
  String selectedLanguage = listLanguage[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        centerTitle: true,
        title: Text(
          'Discoverability',
          style: mST20R.copyWith(fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Wrap(
                  children: [
                    Text(
                      'Help listeners discover your podcast. \nYou can always change this later',
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: mST14R.copyWith(height: 1.5),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Category',
                      textAlign: TextAlign.left,
                      style: mST16R.copyWith(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DropdownButtonFormField(
                      value: selectedCategory,
                      items: listCategory
                          .map(
                            (item) => DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: mST14R,
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          selectedCategory = val as String;
                        });
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 30,
                        color: Colors.green.shade300,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors
                                  .green.shade400), // Màu border khi focus
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Language',
                      textAlign: TextAlign.left,
                      style: mST16R.copyWith(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    DropdownButtonFormField(
                      value: selectedLanguage,
                      items: listLanguage
                          .map(
                            (item) => DropdownMenuItem(
                              value: item,
                              child: Text(
                                item,
                                style: mST14R,
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (val) {
                        setState(() {
                          selectedLanguage = val as String;
                        });
                      },
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 30,
                        color: Colors.green.shade300,
                      ),
                      focusColor: Colors.green,
                      dropdownColor: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors
                                  .green.shade400), // Màu border khi focus
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    //Xử lý sự kiên khi nhấn Continue
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.green.shade400),
                    child: Text(
                      'Continue',
                      textAlign: TextAlign.center,
                      style: mST16R.copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // Xử lý sự kiện khi nhấp vào text
                  },
                  child: Text(
                    'Save and finish later',
                    style: mST16R.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
