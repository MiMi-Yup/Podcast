import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';

import 'm_primary_button.dart';

Future<bool?> showConfirmBottomModal(BuildContext context, String title,
        {String? confirm}) =>
    showModalBottomSheet<bool>(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10.0))),
        builder: (_) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Text(title, style: mST18M),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MPrimaryButton(
                          text: MultiLanguage.of(context).cancel,
                          onPressed: () => XMDRouter.pop(result: false),
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
                          onPressed: () => XMDRouter.pop(result: true)),
                    ))
                  ],
                )
              ]),
            ));
