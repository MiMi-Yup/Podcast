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
import 'package:join_podcast/presentation/auth/verify/verify_create_route.dart';
import 'package:join_podcast/presentation/auth/verify/verify_forgot_route.dart';
import 'package:join_podcast/presentation/bottom_bar/bottom_bar_route.dart';
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
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();

    _emailController.addListener(
        () => context.read<LoginCubit>().emailChanged(_emailController.text));
    _passwordController.addListener(() =>
        context.read<LoginCubit>().passwordChanged(_passwordController.text));
    _confirmPasswordController.addListener(() => context
        .read<LoginCubit>()
        .confirmPasswordChanged(_confirmPasswordController.text));
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
            buildWhen: (previous, current) =>
                current.runtimeType != previous.runtimeType,
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
          BlocConsumer<LoginCubit, ALoginState>(
              listenWhen: (previous, current) => current is SignUpState,
              listener: (context, state) {
                if (state is SignUpState &&
                    state.confirmPassword != _confirmPasswordController.text) {
                  _confirmPasswordController.text = state.confirmPassword;
                  _confirmPasswordController.selection =
                      TextSelection.collapsed(
                          offset: state.confirmPassword.length);
                }
              },
              buildWhen: (previous, current) =>
                  current.runtimeType != previous.runtimeType,
              builder: (context, state) => state is SignUpState
                  ? Padding(
                      padding: EdgeInsets.all(mPaddingNormal),
                      child: MTextField(
                        controller: _confirmPasswordController,
                        obscureText: true,
                        hintText: MultiLanguage.of(context).confirmPassword,
                        preIcon: Icons.lock,
                      ),
                    )
                  : const SizedBox.shrink()),
          BlocBuilder<LoginCubit, ALoginState>(
              buildWhen: (previous, current) =>
                  previous.rememberAccount != current.rememberAccount,
              builder: (context, state) {
                toogleState(value) =>
                    context.read<LoginCubit>().rememberAccount(value ?? false);
                return GestureDetector(
                  onTap: () => toogleState(!state.rememberAccount),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: state.rememberAccount,
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.all<Color>(mCPrimary),
                        onChanged: toogleState,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(mPadding / 4)),
                        side: BorderSide(color: mCPrimary),
                        materialTapTargetSize: MaterialTapTargetSize.padded,
                      ),
                      Text(
                        MultiLanguage.of(context).rememberAccount,
                        style: mST16R.copyWith(color: mCPrimary),
                      )
                    ],
                  ),
                );
              }),
          //login button
          Padding(
            padding: EdgeInsets.all(mPadding),
            child: Row(
              children: [
                Expanded(
                  child: BlocConsumer<LoginCubit, ALoginState>(
                    listener: (context, state) {
                      switch (state.status) {
                        case LoginStatus.inputInValid:
                          AlertUtil.showToast(
                              MultiLanguage.of(context).inValidInput);
                          break;
                        case LoginStatus.success:
                          AlertUtil.hideLoading();
                          if (state is SignUpState) {
                            XMDRouter.pushNamed(routerIds[VerifyCreateRoute]!,
                                arguments: {'email': state.email});
                          } else {
                            XMDRouter.pushNamed(routerIds[BottomBarRoute]!);
                          }
                          break;
                        case LoginStatus.submitting:
                          AlertUtil.showLoading();
                          break;
                        default:
                      }
                    },
                    buildWhen: (previous, current) =>
                        current.runtimeType != previous.runtimeType,
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
          BlocBuilder<LoginCubit, ALoginState>(
              buildWhen: (previous, current) =>
                  current.runtimeType != previous.runtimeType,
              builder: (context, state) => state is LoginState
                  ? TextButton(
                      onPressed: () {
                        final state = context.read<LoginCubit>().state;
                        if (state.isEmailValid) {
                          XMDRouter.pushNamed(routerIds[VerifyForgotRoute]!,
                              arguments: {'email': state.email});
                        } else {
                          AlertUtil.showToast(MultiLanguage.of(context).emailInvalid);
                        }
                      },
                      child: Text(MultiLanguage.of(context).forgotTheAccount))
                  : const SizedBox.shrink()),
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
                        background:
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.grey.shade800
                                : null,
                        onTap: null,
                        padding: EdgeInsets.only(
                            left: mPaddingLarge,
                            right: mPaddingLarge,
                            top: mPadding,
                            bottom: mPadding),
                        child:
                            Image.asset(mAGoogle, scale: 3, isAntiAlias: true)),
                    MSecondaryButton(
                        background:
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.grey.shade800
                                : null,
                        onTap: null,
                        padding: EdgeInsets.only(
                            left: mPaddingLarge,
                            right: mPaddingLarge,
                            top: mPadding,
                            bottom: mPadding),
                        child: Image.asset(mAFacebook,
                            scale: 3, isAntiAlias: true)),
                    MSecondaryButton(
                        background:
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.grey.shade800
                                : null,
                        onTap: null,
                        padding: EdgeInsets.only(
                            left: mPaddingLarge,
                            right: mPaddingLarge,
                            top: mPadding,
                            bottom: mPadding),
                        child:
                            Image.asset(mAApple, scale: 3, isAntiAlias: true)),
                  ],
                ),
              ),
              BlocBuilder<LoginCubit, ALoginState>(
                  buildWhen: (previous, current) =>
                      current.runtimeType != previous.runtimeType,
                  builder: (context, state) => Padding(
                        padding: EdgeInsets.symmetric(vertical: mSpacing),
                        child: Text.rich(
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
                                  ..onTap =
                                      context.read<LoginCubit>().swapAccess)
                          ]),
                          style: mST16M.copyWith(color: Colors.grey),
                        ),
                      )),
            ],
          ))
        ],
      ),
    );
  }
}
