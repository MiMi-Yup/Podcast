import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';

class MTextField extends StatefulWidget {
  const MTextField(
      {Key? key,
      this.controller,
      this.onChanged,
      this.hintText = "",
      this.obscureText = false,
      this.preIcon,
      this.readOnly = false,
      this.onTap,
      this.errorText,
      this.maxLine = 1})
      : super(key: key);

  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String hintText;
  final bool obscureText;
  final IconData? preIcon;
  final bool readOnly;
  final void Function()? onTap;
  final String? errorText;
  final int maxLine;

  @override
  State<MTextField> createState() => _MTextFieldState();
}

class _MTextFieldState extends State<MTextField> {
  late bool isPassword;

  @override
  void initState() {
    isPassword = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: widget.maxLine,
      controller: widget.controller,
      onChanged: widget.onChanged,
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      decoration: InputDecoration(
        errorText: widget.errorText,
        prefixIcon: widget.preIcon != null ? Icon(widget.preIcon) : null,
        suffixIcon: widget.obscureText
            ? GestureDetector(
                child: Icon(
                    isPassword ? Icons.remove_red_eye : Icons.visibility_off),
                onTap: () {
                  setState(() {
                    isPassword = !isPassword;
                  });
                },
              )
            : null,
        border:
            OutlineInputBorder(borderRadius: BorderRadius.circular(mPadding)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(mPadding),
            borderSide: const BorderSide(style: BorderStyle.none)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(mPadding),
            borderSide: const BorderSide(style: BorderStyle.none)),
        filled: true,
        fillColor: Colors.grey.withAlpha(25),
        hintText: widget.hintText,
      ),
      obscureText: isPassword,
    );
  }
}
