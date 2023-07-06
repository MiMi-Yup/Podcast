import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';
import 'package:join_podcast/common/widgets/m_primary_button.dart';
import 'package:join_podcast/common/widgets/m_text_field.dart';

Future<String?> showTextFieldBottomModal(
    BuildContext context, String title, TextEditingController controller,
    {String? preText, String? confirm}) {
  controller.text = preText ?? '';
  return showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))),
      builder: (context) => Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: mSpacing),
                child: Text(title, style: mST18M),
              ),
              Padding(
                padding: EdgeInsets.all(mSpacing),
                child: MTextField(
                  controller: controller,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MPrimaryButton(
                        text: MultiLanguage.of(context).cancel,
                        onPressed: () => XMDRouter.pop(),
                        background: const Color.fromARGB(255, 245, 231, 255),
                        textColor: const Color.fromARGB(255, 165, 51, 255),
                      ),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MPrimaryButton(
                        text: confirm ?? MultiLanguage.of(context).confirm,
                        background: mCPrimary,
                        onPressed: () =>
                            XMDRouter.pop(result: controller.text)),
                  ))
                ],
              )
            ]),
          ));
}
