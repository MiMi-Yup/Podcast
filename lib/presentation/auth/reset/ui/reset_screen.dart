import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/common/widgets/m_primary_button.dart';
import 'package:join_podcast/common/widgets/m_text_field.dart';
import 'package:join_podcast/presentation/auth/reset/cubit/reset_cubit.dart';

class ResetAccountScreen extends StatefulWidget {
  const ResetAccountScreen({super.key});

  @override
  State<ResetAccountScreen> createState() => _ResetAccountScreenState();
}

class _ResetAccountScreenState extends State<ResetAccountScreen> {
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();

    _confirmPasswordController.addListener(() => context
        .read<ResetAccountCubit>()
        .confirmPasswordChanged(_confirmPasswordController.text));
    _passwordController.addListener(() => context
        .read<ResetAccountCubit>()
        .passwordChanged(_passwordController.text));
  }

  @override
  void dispose() {
    _confirmPasswordController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(MultiLanguage.of(context).resetPassword),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BlocListener<ResetAccountCubit, ResetAccountState>(
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
                  preIcon: Icons.lock,
                  hintText: MultiLanguage.of(context).email,
                ),
              )),
          BlocListener<ResetAccountCubit, ResetAccountState>(
              listener: (context, state) {
                if (state.confirmPassword != _confirmPasswordController.text) {
                  _confirmPasswordController.text = state.confirmPassword;
                  _confirmPasswordController.selection =
                      TextSelection.collapsed(
                          offset: state.confirmPassword.length);
                }
              },
              child: Padding(
                padding: EdgeInsets.all(mPaddingNormal),
                child: MTextField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  hintText: MultiLanguage.of(context).confirmPassword,
                  preIcon: Icons.lock,
                ),
              )),
          BlocBuilder<ResetAccountCubit, ResetAccountState>(
              buildWhen: (previous, current) =>
                  previous.rememberAccount != current.rememberAccount,
              builder: (context, state) {
                toogleState(value) => context
                    .read<ResetAccountCubit>()
                    .rememberAccount(value ?? false);
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
          Container(
            width: double.maxFinite,
            padding: EdgeInsets.all(mSpacing),
            child: MPrimaryButton(
                text: MultiLanguage.of(context).m_continue, onPressed: null),
          )
        ],
      ),
    );
  }
}
