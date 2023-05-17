import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:configuration/style/style.dart';
import 'package:configuration/utility/constants/asset_constants.dart';
import 'package:flutter/material.dart';
import 'package:join_podcast/common/widgets/m_Author.dart';
import 'package:join_podcast/common/widgets/m_podcast_component.dart';
import 'package:join_podcast/common/widgets/m_section.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/author/author_route.dart';
import 'package:join_podcast/presentation/library/library_route.dart';
import 'package:join_podcast/presentation/notification/notification_route.dart';
import 'package:join_podcast/presentation/subscription/subscription_route.dart';

class ListRecordScreen extends StatelessWidget {
  const ListRecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // recordpce (432:182)
      padding: EdgeInsets.fromLTRB(
          23, 11, 23.02, 252.5),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xffffffff),
      ),
      child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            // typedefaultcomponenttopbarVin (432:190)
            margin: EdgeInsets.fromLTRB(0, 0, 0, 164),
            width: double.infinity,
            child:
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // D8z (432:191)
                  margin: EdgeInsets.fromLTRB(
                      0, 0, 284, 0),
                  child:
                  Text(
                    '9:41',
                    style: mST18M,
                  ),
                ),
                Container(
                  // groupuGi (432:192)
                  margin: EdgeInsets.fromLTRB(
                      0, 1, 5, 0),
                  width: 18,
                  height: 10,
                  child:
                  IconButton(
                    icon: Icon(Icons.skip_previous),
                    onPressed: () {  },
                  ),
                ),
                Container(
                  // groupocz (432:198)
                  margin: EdgeInsets.fromLTRB(
                      0, 0, 5.73, 0.03),
                  width: 15.27,
                  height: 10.97,
                  child:
                  IconButton(
                    icon: Icon(Icons.skip_previous),
                    onPressed: () {  },
                  ),
                ),
                Container(
                  // groupiEA (432:203)
                  width: 26.98,
                  height: 13,
                  child:
                  IconButton(
                    icon: Icon(Icons.skip_previous),
                    onPressed: () {  },
                  ),
                ),
              ],
            ),
          ),
          Center(
            // recordFUz (432:183)
            child:
            Container(
              margin: EdgeInsets.fromLTRB(
                  0, 0, 1.98, 162),
              child:
              Text(
                'Record',
                textAlign: TextAlign.center,
                style: mST18M,
              ),
            ),
          ),
          Container(
            // autolayoutvertical9aN (432:184)
            margin: EdgeInsets.fromLTRB(
                112, 0, 110.98, 0),
            width: double.infinity,
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // autogroupkqa6HAn (Bf87VNthpCKxNwT19pKqA6)
                  margin: EdgeInsets.fromLTRB(
                      0, 0, 1, 75.5),
                  width: 154,
                  height: 154,
                  child:
                  IconButton(
                    icon: Icon(Icons.skip_previous),
                    onPressed: () {  },
                  ),
                ),
                Center(
                  // bhG (432:189)
                  child:
                  Text(
                    '00:00:00',
                    textAlign: TextAlign.center,
                    style: mST18M,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  }
