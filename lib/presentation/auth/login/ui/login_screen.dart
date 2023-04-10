import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:configuration/style/style.dart';
import 'package:configuration/utility/constants/asset_constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/common/widgets/m_primary_button.dart';
import 'package:join_podcast/common/widgets/m_secondary_button.dart';
import 'package:join_podcast/common/widgets/m_text_field.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/auth/login/cubit/login_cubit.dart';
import 'package:join_podcast/utils/alert_util.dart';
import 'package:join_podcast/utils/extensions/context_extension.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    _emailController.addListener(
        () => context.read<LoginCubit>().emailChanged(_emailController.text));
    _passwordController.addListener(() =>
        context.read<LoginCubit>().passwordChanged(_passwordController.text));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(mAChilling, height: context.screenSize.height / 3.5),
          //login text
          BlocBuilder<LoginCubit, ALoginState>(
            builder: (context, state) => Text(
              state is SignUpState
                  ? MultiLanguage.of(context).signUpTitle
                  : MultiLanguage.of(context).loginTitle,
              style: textTitleStyleH1,
            ),
          ),
          BlocListener<LoginCubit, ALoginState>(
              listener: (context, state) {
                if (state.email != _emailController.text) {
                  _emailController.text = state.email;
                  _emailController.selection =
                      TextSelection.collapsed(offset: state.email.length);
                }
              },
              child: Padding(
                padding: EdgeInsets.all(mPaddingNormal),
                child: MTextField(
                  controller: _emailController,
                  hintText: MultiLanguage.of(context).email,
                  preIcon: Icons.person,
                ),
              )),
          BlocListener<LoginCubit, ALoginState>(
              listener: (context, state) {
                if (state.password != _passwordController.text) {
                  _passwordController.text = state.password;
                  _passwordController.selection =
                      TextSelection.collapsed(offset: state.password.length);
                }
              },
              child: Padding(
                padding: EdgeInsets.all(mPaddingNormal),
                child: MTextField(
                  controller: _passwordController,
                  obscureText: true,
                  hintText: MultiLanguage.of(context).password,
                  preIcon: Icons.lock,
                ),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<LoginCubit, ALoginState>(
                  builder: (context, state) => Checkbox(
                        value: state.rememberAccount,
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.all<Color>(mCPrimary),
                        onChanged: (value) => context
                            .read<LoginCubit>()
                            .rememberAccount(value ?? false),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(mPadding / 4)),
                        side: BorderSide(color: mCPrimary),
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                      )),
              Text(
                MultiLanguage.of(context).rememberAccount,
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
                  child: BlocConsumer<LoginCubit, ALoginState>(
                    listener: (context, state) {
                      switch (state.status) {
                        case LoginStatus.error:
                          AlertUtil.showToast(
                              MultiLanguage.of(context).inValidInput);
                          break;
                        case LoginStatus.success:
                          if (state is SignUpState) {
                            // XMDRouter.pushNamed('AccountSetupRoute');
                          } else {
                            // XMDRouter.pushNamed(routerIds[HomeRoute]!);
                          }
                          break;
                        case LoginStatus.submitting:
                          AlertUtil.showLoading();
                          break;
                        default:
                      }
                    },
                    builder: (context, state) => MPrimaryButton(
                        text: state is SignUpState
                            ? MultiLanguage.of(context).signUp
                            : MultiLanguage.of(context).login,
                        onPressed: context.read<LoginCubit>().primaryAction),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: mSpacing),
                child: Text(MultiLanguage.of(context).otherLogin),
              ),
              Padding(
                padding: EdgeInsets.all(mSpacing),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MSecondaryButton(
                        onTap: null,
                        padding: EdgeInsets.only(
                            left: mPaddingLarge,
                            right: mPaddingLarge,
                            top: mPadding,
                            bottom: mPadding),
                        child:
                            Image.asset(mAGoogle, scale: 2, isAntiAlias: true)),
                    MSecondaryButton(
                        onTap: null,
                        padding: EdgeInsets.only(
                            left: mPaddingLarge,
                            right: mPaddingLarge,
                            top: mPadding,
                            bottom: mPadding),
                        child: Image.asset(mAFacebook,
                            scale: 2, isAntiAlias: true)),
                    MSecondaryButton(
                        onTap: null,
                        padding: EdgeInsets.only(
                            left: mPaddingLarge,
                            right: mPaddingLarge,
                            top: mPadding,
                            bottom: mPadding),
                        child:
                            Image.asset(mAApple, scale: 2, isAntiAlias: true)),
                  ],
                ),
              ),
              BlocBuilder<LoginCubit, ALoginState>(
                  builder: (context, state) => Text.rich(
                        TextSpan(children: [
                          TextSpan(
                              text: state is SignUpState
                                  ? MultiLanguage.of(context).loginSuggest
                                  : MultiLanguage.of(context).signUpSuggest),
                          TextSpan(
                              text: state is SignUpState
                                  ? MultiLanguage.of(context).login
                                  : MultiLanguage.of(context).signUp,
                              style: mST16M.copyWith(color: mCPrimary),
                              recognizer: TapGestureRecognizer()
                                ..onTap = context.read<LoginCubit>().swapAccess)
                        ]),
                        style: mST16M.copyWith(color: Colors.grey),
                      )),
              SizedBox(
                height: mPaddingLarge,
              )
            ],
          ))
        ],
      ),
    );
  }
}
