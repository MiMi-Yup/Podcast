import 'dart:async';
import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:flutter/material.dart';
import 'package:configuration/style/style.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/presentation/welcome_page/cubit/welcome_page_cubit.dart';
import 'package:join_podcast/utils/alert_util.dart';

class WelcomePageScreen extends StatefulWidget {
  const WelcomePageScreen({Key? key}) : super(key: key);

  @override
  State<WelcomePageScreen> createState() => _WelcomePageScreenState();
}

class _WelcomePageScreenState extends State<WelcomePageScreen> {
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
    context.read<WelcomePageCubit>().init();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WelcomePageCubit, WelcomePageState>(
      listener: (context, state) {
        switch (state.status) {
          case WelcomeStatus.newUser:
            XMDRouter.pushNamedAndRemoveUntil('IntroductionPageRoute');
            break;
          case WelcomeStatus.login:
            XMDRouter.pushNamedAndRemoveUntil('HomePageRoute');
            break;
          case WelcomeStatus.error:
            AlertUtil.showToast(MultiLanguage.of(context).systemError);
            break;
          default:
            break;
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: null,
          body: Container(
            decoration: BoxDecoration(color: mCLightBackground),
            child: AnimatedOpacity(
                duration: Duration(seconds: 2),
                opacity: opacityLevel,
                child: Center(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image(
                          image: AssetImage("assets/img/logo.png"),
                          width: 75,
                        ),
                        SizedBox(width: mSpacing),
                        Text(
                          "WeTalk",
                          style: mST32M,
                        )
                      ]),
                )),
          ),
        );
      },
    );
  }
}
