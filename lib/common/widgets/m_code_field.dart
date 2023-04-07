import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class MCodeField extends StatelessWidget {
  const MCodeField({required this.controller, Key? key}) : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 5,
      obscureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.circle,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        inactiveFillColor: Colors.black,
        activeFillColor: mCPrimary,
        activeColor: Colors.black,
        selectedFillColor: Colors.black,
        selectedColor: mCPrimary,
      ),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      cursorColor: Colors.white,
      controller: controller,
      keyboardType: TextInputType.number,
      onCompleted: (v) {},
      // onTap: () {
      //   print("Pressed");
      // },
      onChanged: (value) {
        // debugPrint(value);
        // setState(() {
        //   currentText = value;
        // });
      },
      beforeTextPaste: (text) => true,
    );
  }
}
