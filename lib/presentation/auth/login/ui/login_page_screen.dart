import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:configuration/style/style.dart';
import 'package:configuration/utility/constants/asset_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/common/widgets/m_primary_button.dart';
import 'package:join_podcast/common/widgets/m_text_field.dart';
import 'package:join_podcast/presentation/auth/login/cubit/login_page_cubit.dart';
import 'package:join_podcast/utils/alert_util.dart';
import 'package:join_podcast/utils/extensions/context_extension.dart';

class LoginPageScreen extends StatelessWidget {
  const LoginPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(mAChilling, height: context.screenSize.height / 3.5),
          //login text
          Text(
            MultiLanguage.of(context).login,
            style: textTitleStyleH1,
          ),
          Padding(
            padding: EdgeInsets.all(mPaddingNormal),
            child: MTextField(
              onChanged: (value) =>
                  context.read<LoginPageCubit>().emailChanged(value),
              hintText: MultiLanguage.of(context).email,
              preIcon: Icons.person,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(mPaddingNormal),
            child: MTextField(
              onChanged: (value) =>
                  context.read<LoginPageCubit>().passwordChanged(value),
              obscureText: true,
              hintText: MultiLanguage.of(context).password,
              preIcon: Icons.lock,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: false,
                checkColor: Colors.white,
                fillColor: MaterialStateProperty.all<Color>(mCPrimary),
                onChanged: (value) => null,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(mPadding / 4)),
                side: BorderSide(color: mCPrimary),
                materialTapTargetSize: MaterialTapTargetSize.padded,
              ),
              Text(
                "Remember me",
                style: mST16R.copyWith(color: mCPrimary),
              )
            ],
          ),
          //login button
          Padding(
            padding: EdgeInsets.all(mPadding),
            child: Row(
              children: [
                Expanded(
                  child: BlocConsumer<LoginPageCubit, LoginPageState>(
                    listener: (context, state) {
                      if (state.status == LoginStatus.success) {
                        XMDRouter.pushNamedAndRemoveUntil('HomePageRoute');
                      }
                    },
                    builder: (context, state) =>
                        MPrimaryButton(text: "Sign in", onPressed: () => null),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: mSpacing),
            child: Text(MultiLanguage.of(context).otherLogin),
          ),
          Padding(
            padding: EdgeInsets.all(mSpacing),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(mPadding)),
                    padding: EdgeInsets.all(mPadding),
                    child: Icon(Icons.label),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(mPadding)),
                    padding: EdgeInsets.all(mPadding),
                    child: Icon(Icons.label),
                  ),
                ),
                GestureDetector(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(mPadding)),
                    padding: EdgeInsets.all(mPadding),
                    child: Icon(Icons.label),
                  ),
                )
              ],
            ),
          ),
          Text.rich(
            TextSpan(children: [
              TextSpan(text: "Don't have an account "),
              TextSpan(
                  text: "Sign up", style: mST16M.copyWith(color: mCPrimary))
            ]),
            style: mST16M.copyWith(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
