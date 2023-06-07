import 'dart:io';

import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/common/widgets/m_primary_button.dart';
import 'package:join_podcast/common/widgets/m_text_field.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/bottom_bar/bottom_bar_route.dart';
import 'package:join_podcast/presentation/new_user/add_info/cubit/add_info_cubit.dart';
import 'package:join_podcast/presentation/new_user/interest/interest_route.dart';
import 'package:join_podcast/utils/alert_util.dart';
import 'package:join_podcast/utils/extensions/date_extension.dart';
import 'package:image_picker/image_picker.dart';

class AddInfoScreen extends StatelessWidget {
  AddInfoScreen({super.key});

  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _controller = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            MultiLanguage.of(context).fillInfo,
          ),
          elevation: 0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(mPadding),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    final file =
                        await _picker.pickImage(source: ImageSource.gallery);
                    if (file != null) {
                      context.read<AddInfoCubit>().changeAvatar(file);
                    }
                  },
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      BlocBuilder<AddInfoCubit, AddInfoState>(
                          builder: (context, state) => Container(
                                height: 100,
                                width: 100,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: state.avatar == null
                                            ? NetworkImage(state.initAvatar)
                                            : FileImage(File(state.avatar!))
                                                as ImageProvider),
                                    color: Colors.grey),
                              )),
                      Container(
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 165, 51, 255),
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(Icons.edit),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10),
                BlocListener<AddInfoCubit, AddInfoState>(
                  listener: (context, state) {
                    if (state.fullname != _controller.text) {
                      _controller.text = state.fullname ?? '';
                      _controller.selection = TextSelection.collapsed(
                          offset: state.fullname?.length ?? 0);
                    }
                  },
                  child: MTextField(
                    controller: _controller,
                    hintText: MultiLanguage.of(context).fullName,
                    onChanged: (value) =>
                        context.read<AddInfoCubit>().changeName(value),
                  ),
                ),
                SizedBox(height: 10),
                BlocListener<AddInfoCubit, AddInfoState>(
                  listenWhen: (previous, current) =>
                      previous.dateOfBirth != current.dateOfBirth,
                  listener: (context, state) {
                    _dateController.text =
                        state.dateOfBirth?.toStringDateEx ?? '';
                  },
                  child: MTextField(
                    hintText: MultiLanguage.of(context).dateOfBirth,
                    controller: _dateController,
                    readOnly: true,
                    onTap: () async {
                      final datePicker = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900, 1, 1),
                          lastDate: DateTime.now());
                      if (datePicker != null) {
                        context.read<AddInfoCubit>().changeBirth(datePicker);
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MPrimaryButton(
                    text: MultiLanguage.of(context).skip,
                    onPressed: () =>
                        XMDRouter.popAndPushNamed(routerIds[InterestRoute]!),
                    background: const Color.fromARGB(255, 245, 231, 255),
                    textColor: const Color.fromARGB(255, 165, 51, 255),
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: BlocListener<AddInfoCubit, AddInfoState>(
                  listener: (context, state) {
                    switch (state.state) {
                      case Status.success:
                        if (state.signUp) {
                          XMDRouter.pushNamedAndRemoveUntil(
                              routerIds[BottomBarRoute]!);
                        } else {
                          XMDRouter.popNamedAndRemoveUntil(
                              routerIds[BottomBarRoute]!);
                        }
                        break;
                      case Status.error:
                        AlertUtil.hideLoading();
                        AlertUtil.showToast(
                            MultiLanguage.of(context).systemError);
                        break;
                      case Status.submitting:
                        AlertUtil.showLoading();
                        break;
                      default:
                        break;
                    }
                  },
                  child: MPrimaryButton(
                      text: MultiLanguage.of(context).m_continue,
                      onPressed: context.read<AddInfoCubit>().updateProfile),
                ),
              ))
            ],
          )
        ],
      ),
    );
  }
}
