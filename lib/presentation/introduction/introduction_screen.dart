import 'dart:async';

import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:configuration/style/style.dart';
import 'package:configuration/utility/constants/asset_constants.dart';
import 'package:flutter/material.dart';
import 'package:join_podcast/common/widgets/m_primary_button.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/auth/login/login_route.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroductionModel {
  String imageAsset;
  String title;
  String subTitle;
  IntroductionModel(this.imageAsset, this.title, this.subTitle);
}

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final _pages = 3;
  late PageController _controller;
  late Timer _timer;
  bool endPage = false;
  int currentPosition = 0;

  final List<IntroductionModel> introductions = [
    IntroductionModel(mAIntroduction1, "Gain total control",
        "Listen to the best podcasts every day with WeTalk now"),
    IntroductionModel(
        mAIntroduction2, "Know where your", "Track your transaction easily"),
    IntroductionModel(
        mAIntroduction3, "Planing ahead", "Setup your budget for each category")
  ];

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: currentPosition);
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      switch (currentPosition) {
        case 0:
          endPage = false;
          break;
        case 2:
          endPage = true;
          break;
        default:
      }
      endPage
          ? _controller.previousPage(
              duration: const Duration(milliseconds: 250), curve: Curves.linear)
          : _controller.nextPage(
              duration: const Duration(milliseconds: 250),
              curve: Curves.linear);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: PageView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => Column(
                children: [
                  Expanded(
                      child: Image.asset(
                    introductions[index].imageAsset,
                    fit: BoxFit.fitWidth,
                  )),
                  SizedBox(
                    height: mPaddingLarge * 4,
                    child: Text.rich(
                        TextSpan(children: [
                          TextSpan(
                              text:
                                  "Listen to the best podcasts every day with "),
                          TextSpan(
                              text: "WeTalk",
                              style: mST32M.copyWith(color: mCPrimary)),
                          TextSpan(text: " now!")
                        ]),
                        style: mST32M,
                        textAlign: TextAlign.center),
                  )
                ],
              ),
              itemCount: _pages,
              controller: _controller,
              onPageChanged: (value) => setState(() {
                currentPosition = value;
              }),
              allowImplicitScrolling: false,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(mPaddingNormal),
            child: SmoothPageIndicator(
              controller: _controller,
              count: _pages,
              effect: ExpandingDotsEffect(
                  dotHeight: 12, dotWidth: 12, activeDotColor: mCPrimary),
            ),
          ),
          Container(
            width: double.maxFinite,
            height: 50,
            margin: EdgeInsets.all(10),
            child: MPrimaryButton(
                text: MultiLanguage.of(context).login,
                onPressed: () => XMDRouter.pushNamed(routerIds[LoginRoute]!),
                background: mCPrimary),
          ),
          Container(
            width: double.maxFinite,
            height: 50,
            margin: EdgeInsets.all(10),
            child: MPrimaryButton(
                text: MultiLanguage.of(context).tryIt,
                onPressed: null,
                // onPressed: () => XMDRouter.pushNamed(routerIds[HomeRoute]!),
                background: mCSecondary),
          )
        ],
      ),
    );
  }
}
