import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/common/widgets/m_primary_button.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/auth/reset/reset_route.dart';
import 'package:join_podcast/presentation/auth/verify/cubit/verify_create_cubit.dart';
import 'package:join_podcast/presentation/auth/verify/cubit/verify_cubit.dart';
import 'package:join_podcast/presentation/auth/verify/cubit/verify_forgot_cubit.dart';
import 'package:join_podcast/presentation/auth/verify/cubit/verify_state.dart';
import 'package:join_podcast/presentation/new_user/add_info/add_info_route.dart';
import 'package:join_podcast/utils/alert_util.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyScreen extends StatelessWidget {
  VerifyScreen({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text(context.read<VerifyCubit>() is VerifyCreateCubit
              ? MultiLanguage.of(context).verifyCreate
              : MultiLanguage.of(context).forgotAccount),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
                child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FutureBuilder<bool>(
                    future: context.read<VerifyCubit>().request(),
                    builder: (context, snapshot) => snapshot.hasData
                        ? snapshot.data!
                            ? Text(
                                "${MultiLanguage.of(context).codeHaveBeenSend} ${context.read<VerifyCubit>().email}",
                                style: mST18R,
                                textAlign: TextAlign.center,
                              )
                            : Text(MultiLanguage.of(context).systemError)
                        : const LinearProgressIndicator(),
                  ),
                  SizedBox(
                    height: mSpacing,
                  ),
                  BlocListener<VerifyCubit, VerifyState>(
                    listenWhen: (previous, current) =>
                        previous.code != current.code,
                    listener: (context, state) {
                      if (_controller.text != state.code) {
                        _controller.text = state.code;
                        _controller.text = state.code;
                        _controller.selection =
                            TextSelection.collapsed(offset: state.code.length);
                      }
                    },
                    child: PinCodeTextField(
                      appContext: context,
                      pastedTextStyle: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 5,
                      blinkWhenObscuring: true,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(10.0),
                          fieldHeight: 60,
                          fieldWidth: 70,
                          activeFillColor: Colors.grey.withAlpha(25),
                          activeColor: Colors.grey.withAlpha(25),
                          inactiveColor: Colors.grey.withAlpha(25),
                          inactiveFillColor: Colors.grey.withAlpha(25),
                          selectedFillColor: mCPrimary),
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      boxShadows: const [
                        BoxShadow(
                          offset: Offset(0, 1),
                          color: Colors.black12,
                          blurRadius: 5,
                        )
                      ],
                      onCompleted: (_) => context.read<VerifyCubit>().verify(),
                      onChanged: (value) {
                        context.read<VerifyCubit>().changeCode(value);
                      },
                      beforeTextPaste: (text) {
                        return true;
                      },
                    ),
                  )
                ],
              ),
            )),
            BlocListener<VerifyCubit, VerifyState>(
              listenWhen: (previous, current) =>
                  previous.status != current.status,
              listener: (context, state) {
                switch (state.status) {
                  case VerifyStatus.checking:
                    AlertUtil.showLoading();
                    break;
                  case VerifyStatus.confirmed:
                    final cubit = context.read<VerifyCubit>();
                    if (cubit is VerifyCreateCubit) {
                      XMDRouter.popAndPushNamed(routerIds[AddInfoRoute]!,
                          arguments: {'signUp': true});
                    } else if (cubit is VerifyForgotCubit) {
                      XMDRouter.popAndPushNamed(routerIds[ResetAccountRoute]!,
                          arguments: {'token': cubit.token});
                    }
                    break;
                  case VerifyStatus.failed:
                    context.read<VerifyCubit>().changeCode('');
                    break;
                  default:
                    break;
                }
              },
              child: Container(
                  width: double.maxFinite,
                  padding: EdgeInsets.all(mSpacing * 2),
                  child: MPrimaryButton(
                      text: MultiLanguage.of(context).verify,
                      onPressed: context.read<VerifyCubit>().verify)),
            )
          ],
        ));
  }
}
