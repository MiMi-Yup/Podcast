import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';

class PodcastAvailabilityScreen extends StatefulWidget {
  const PodcastAvailabilityScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PodcastAvailabilityScreen> createState() =>
      _PodcastAvailabilityScreen();
}

class _PodcastAvailabilityScreen extends State<PodcastAvailabilityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Podcast Availability',
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
            TextButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                      top: Radius.circular(30),
                    )),
                    builder: (context) => Container(
                          padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
                          child:
                              Column(mainAxisSize: MainAxisSize.min, children: [
                            Center(
                              child: Container(
                                width: 50,
                                padding: EdgeInsets.only(bottom: 20),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Divider(
                                  color: mCGray100,
                                  thickness: 3,
                                ),
                              ),
                            ),
                            Text(
                              "Sort & Filter",
                              style: textBigTitleStyleH2,
                            ),
                            Divider(
                              color: mCGray200,
                              thickness: 0.5,
                              height: 40,
                            ),
                            FlutterLogo(
                              size: 120,
                            ),
                            Divider(
                              color: mCGray200,
                              thickness: 0.5,
                              height: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                      child: Text("Reset",
                                          style: mST16M.copyWith(
                                              color: mCGreen500)),
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all<
                                                EdgeInsets>(
                                            EdgeInsets.symmetric(vertical: 15)),
                                        elevation:
                                            MaterialStateProperty.all<double>(
                                                5),
                                        shadowColor:
                                            MaterialStateProperty.all<Color>(
                                                mCGreen100),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                mCGreen100),
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            // Change your radius here
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                      ),
                                      onPressed: () => null),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: ElevatedButton(
                                      child: Text("Apply",
                                          style: mST16M.copyWith(
                                              color: Colors.white)),
                                      style: ButtonStyle(
                                        padding: MaterialStateProperty.all<
                                                EdgeInsets>(
                                            EdgeInsets.symmetric(vertical: 15)),
                                        elevation:
                                            MaterialStateProperty.all<double>(
                                                5),
                                        shadowColor:
                                            MaterialStateProperty.all<Color>(
                                                mCGreen300),
                                        textStyle: MaterialStateProperty.all(
                                          const TextStyle(fontSize: 20),
                                        ),
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                mCGreen500),
                                        shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            // Change your radius here
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                        ),
                                      ),
                                      onPressed: () => null),
                                ),
                              ],
                            )
                          ]),
                        ));
              },
              child: Text("Click here!"),
              style: ButtonStyle(
                  elevation: MaterialStatePropertyAll(1),
                  backgroundColor: MaterialStatePropertyAll(Colors.amber)),
            ),
          ],
        ),
      ),
    );
  }
}
