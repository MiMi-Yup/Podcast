import 'dart:async';
import 'package:configuration/route/xmd_router.dart';
import 'package:configuration/utility/constants/asset_constants.dart';
import 'package:flutter/material.dart';
import 'package:configuration/style/style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/bottom_bar/bottom_bar_route.dart';
import 'package:join_podcast/presentation/introduction/introduction_route.dart';
import 'package:join_podcast/presentation/welcome_page/cubit/welcome_cubit.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  double opacityLevel = 0.0;
  Timer? _timer;

  void _changeOpacity() {
    setState(() => opacityLevel = opacityLevel == 0 ? 1.0 : 0.0);
  }

  @override
  void initState() {
    super.initState();
    _timer =
        Timer.periodic(const Duration(seconds: 2), (timer) => _changeOpacity());
    context.read<WelcomeCubit>().init();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WelcomeCubit, WelcomeState>(
      listener: (context, state) {
        switch (state.status) {
          case WelcomeStatus.newUser:
            XMDRouter.pushNamedAndRemoveUntil(routerIds[IntroductionRoute]!);
            break;
          case WelcomeStatus.login:
            XMDRouter.pushNamedAndRemoveUntil(routerIds[BottomBarRoute]!);
            break;
          case WelcomeStatus.error:
            XMDRouter.pushNamedAndRemoveUntil(routerIds[IntroductionRoute]!);
            break;
          default:
            break;
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: null,
          body: AnimatedOpacity(
              duration: const Duration(seconds: 2),
              opacity: opacityLevel,
              child: Center(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(mALogo),
                        width: 75,
                      ),
                      SizedBox(width: mSpacing),
                      Text(
                        "WeTalk",
                        style: mST32M,
                      )
                    ]),
              )),
        );
      },
    );
  }
}
