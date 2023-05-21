import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/common/widgets/m_primary_button.dart';
import 'package:join_podcast/presentation/auth/verify/cubit/verify_create_cubit.dart';
import 'package:join_podcast/presentation/auth/verify/cubit/verify_cubit.dart';
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
                  Text(
                    "Code has been send to ${context.read<VerifyCubit>().email}",
                    style: mST18R,
                  ),
                  SizedBox(
                    height: mSpacing,
                  ),
                  PinCodeTextField(
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
                  )
                ],
              ),
            )),
            Container(
                width: double.maxFinite,
                padding: EdgeInsets.all(mSpacing * 2),
                child: MPrimaryButton(
                    text: "Verify",
                    onPressed: context.read<VerifyCubit>().verify))
          ],
        ));
  }
}
