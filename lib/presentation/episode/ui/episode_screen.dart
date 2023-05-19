import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';
import 'package:join_podcast/common/widgets/m_author.dart';
import 'package:join_podcast/common/widgets/m_section.dart';
import 'package:sliver_tools/sliver_tools.dart';

class EpisodeScreen extends StatelessWidget {
  const EpisodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Episode 685"),
      ),
      body: CustomScrollView(physics: BouncingScrollPhysics(), slivers: [
        MultiSliver(children: [
          Container(
            margin: const EdgeInsets.all(10.0),
            height: 125.0,
            child: Row(
              children: [
                MAuthor(networkImage: null),
                SizedBox(
                  width: 10.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "The Breakfast Club",
                      style: mST18M,
                    ),
                    Text(
                      "999 podcasts",
                      style: mST16R,
                    ),
                    Row(
                      children: [
                        IconButton(
                            onPressed: () => null, icon: Icon(Icons.circle)),
                        IconButton(
                            onPressed: () => null, icon: Icon(Icons.share))
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(
              "2 hours ago | 55:37 mins",
              style: mST16R.copyWith(color: Colors.grey),
            ),
          )
        ]),
        MSection(
            title:
                "685: Steve Rambam | The Real Life of a Private Investigator",
            headerColor: Theme.of(context).scaffoldBackgroundColor,
            titleColor: Theme.of(context).brightness == Brightness.dark
                ? Colors.white
                : Colors.black,
            content: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 38.0,
                            padding: EdgeInsets.only(left: 4.0, right: 4.0),
                            decoration: BoxDecoration(
                                color: mCPrimary,
                                borderRadius: BorderRadius.circular(50.0)),
                            child: TextButton(
                                onPressed: () => null,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.play_arrow,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    Text("Play",
                                        style: mST14M.copyWith(
                                            color: Colors.white))
                                  ],
                                )),
                          ),
                          IconButton(
                              onPressed: () => null,
                              icon: Icon(Icons.playlist_add)),
                          IconButton(
                              onPressed: () => null,
                              icon: Icon(Icons.download_for_offline_outlined))
                        ],
                      ),
                      IconButton(
                          onPressed: () => null, icon: Icon(Icons.more_vert))
                    ],
                  ),
                  Text(
                    """Steve Rambam (@stevenrambam) is the founder and CEO of Pallorium, Inc., a lincensed Investigative Agency with offices and affiliates worldwide
What We Discuss with Steve Rambam:

Prime bank guarantee fraud: What is it and how does it work?
Why is the US a "Garden of Den" for bad guys in general?
How Steve's TV show Nowhere to Hide came to be.
Why Steve's business doubled within two years following a bogus arrest.
Are there scam lists, and are you on one?
And much more..

Full show notes and resources can be found here: exampledomain.com/685
Like this show? Please leave us a review here --""",
                    style: mST24R,
                  )
                ],
              ),
            )).builder()
      ]),
    );
  }
}
