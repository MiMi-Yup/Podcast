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

class SetInfoPodcastScreen extends StatefulWidget {
  const SetInfoPodcastScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SetInfoPodcastScreen> createState() => _SetInfoPodcastScreen();
}

class _SetInfoPodcastScreen extends State<SetInfoPodcastScreen> {
  String selectedCategory = listCategory[0];
  String selectedLanguage = listLanguage[0];
  bool switchExplicit = false;
  bool switchPublicEmail = false;
  bool switchAutoQA = false;
  int characterNameAllowed = 100;
  int characterDescriptionAllowed = 1000;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 1.0,
        centerTitle: true,
        title: Text(
          'Podcast setting',
          style: mST20R.copyWith(fontWeight: FontWeight.w500),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                // Xử lý sự kiện lưu
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Thông báo"),
                      content: Text("Đã click vào nút Save"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Đóng"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Text(
                "Save",
                textAlign: TextAlign.center,
                style: mST16R.copyWith(
                    fontWeight: FontWeight.bold, color: Colors.green.shade600),
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
          child: Column(
            children: [
              //Avatar
              Stack(
                children: [
                  Container(
                    color: Colors.transparent,
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/800px-Image_created_with_a_mobile_phone.png"))),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Thông báo"),
                              content: Text("Đã click vào nút lưu avatar"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Đóng"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.download_for_offline_outlined,
                          size: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              //Button Update
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        //Xử lý sự kiện update
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("Thông báo"),
                              content: Text("Đã click vào nút Update podcast"),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Đóng"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.green),
                        child: Expanded(
                          child: Text(
                            "Update podcast art",
                            textAlign: TextAlign.center,
                            style: mST16R.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),

              //Info
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Text(
                        "Podcast info",
                        textAlign: TextAlign.left,
                        style: mST24R.copyWith(fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //Podcast Name
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Podcast name",
                        textAlign: TextAlign.left,
                        style: mST18R.copyWith(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Ex: Positive Life',
                        ),
                        onChanged: (value) {
                          setState(() {
                            characterNameAllowed = 100 - value.length;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            characterNameAllowed.toString(),
                            textAlign: TextAlign.right,
                            style: mST14R,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //Podcast Description
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Podcast description",
                        textAlign: TextAlign.left,
                        style: mST18R.copyWith(fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        maxLines: 4,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'This is my podcast',
                        ),
                        onChanged: (value) {
                          setState(() {
                            characterDescriptionAllowed = 1000 - value.length;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            characterDescriptionAllowed.toString(),
                            textAlign: TextAlign.right,
                            style: mST14R,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //Podcast Category
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Podcast category",
                        textAlign: TextAlign.left,
                        style: mST18R.copyWith(fontWeight: FontWeight.w500),
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
                        "Podcast language",
                        textAlign: TextAlign.left,
                        style: mST18R.copyWith(fontWeight: FontWeight.w500),
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
                ],
              ),
              const SizedBox(
                height: 30,
              ),

              //Options
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Text(
                        "Options",
                        textAlign: TextAlign.left,
                        style: mST24R.copyWith(fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                          child: Text(
                        "Explicit content",
                        softWrap: true,
                      )),
                      const SizedBox(
                        width: 10,
                      ),
                      SwitchTheme(
                        data: SwitchThemeData(
                          thumbColor: MaterialStateProperty.all(Colors.white),
                          trackColor:
                              MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.selected)) {
                              return Colors.green;
                            }
                            return const Color.fromARGB(255, 209, 207, 207);
                          }),
                        ),
                        child: SwitchTheme(
                          data: SwitchThemeData(
                            thumbColor: MaterialStateProperty.all(Colors.white),
                            trackColor:
                                MaterialStateProperty.resolveWith((states) {
                              if (states.contains(MaterialState.selected)) {
                                return Colors.green;
                              }
                              return const Color.fromARGB(255, 209, 207, 207);
                            }),
                          ),
                          child: Switch(
                            value: switchExplicit,
                            onChanged: (value) {
                              setState(() {
                                switchExplicit = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: Text(
                          "Display personal email address publicly in RSS feed",
                          softWrap: true,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      SwitchTheme(
                        data: SwitchThemeData(
                          thumbColor: MaterialStateProperty.all(Colors.white),
                          trackColor:
                              MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.selected)) {
                              return Colors.green;
                            }
                            return const Color.fromARGB(255, 209, 207, 207);
                          }),
                        ),
                        child: Switch(
                          value: switchPublicEmail,
                          onChanged: (value) {
                            setState(() {
                              switchPublicEmail = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),

              //Interactivity settings
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Text(
                        "Interactivity settings",
                        textAlign: TextAlign.left,
                        style: mST24R.copyWith(fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                          child: Text(
                        "Include Q&A automatically on all new episodes",
                        softWrap: true,
                      )),
                      const SizedBox(
                        width: 10,
                      ),
                      SwitchTheme(
                        data: SwitchThemeData(
                          thumbColor: MaterialStateProperty.all(Colors.white),
                          trackColor:
                              MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.selected)) {
                              return Colors.green;
                            }
                            return const Color.fromARGB(255, 209, 207, 207);
                          }),
                        ),
                        child: Switch(
                          value: switchAutoQA,
                          onChanged: (value) {
                            setState(() {
                              switchAutoQA = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Need help? Visit ",
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Spotify for Podcasters support",
                      style:
                          mST14R.copyWith(decoration: TextDecoration.underline),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Term of Service",
                      style: mST14R.copyWith(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  const Text(
                    " and ",
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Privacy Policy",
                      style: mST14R.copyWith(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Version 4.11.0",
                style: mST12R,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
