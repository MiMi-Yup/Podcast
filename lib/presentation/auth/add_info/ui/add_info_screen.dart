import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/style/style.dart';
import 'package:configuration/utility/constants/asset_constants.dart';
import 'package:flutter/material.dart';
import 'package:join_podcast/common/widgets/m_primary_button.dart';
import 'package:join_podcast/common/widgets/m_text_field.dart';

class AddInfoScreen extends StatelessWidget {
  const AddInfoScreen({super.key});

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
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage(mAGoogle)),
                          color: Colors.grey),
                    ),
                    Container(
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 165, 51, 255),
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(Icons.edit),
                    )
                  ],
                ),
                SizedBox(height: 10),
                MTextField(
                  hintText: MultiLanguage.of(context).fullName,
                ),
                SizedBox(height: 10),
                MTextField(
                  hintText: MultiLanguage.of(context).nickname,
                ),
                SizedBox(height: 10),
                MTextField(
                  hintText: MultiLanguage.of(context).dateOfBirth,
                ),
                SizedBox(height: 10),
                MTextField(
                  hintText: MultiLanguage.of(context).country,
                )
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
                    onPressed: null,
                    background: const Color.fromARGB(255, 245, 231, 255),
                    textColor: const Color.fromARGB(255, 165, 51, 255),
                  ),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: MPrimaryButton(
                    text: MultiLanguage.of(context).m_continue,
                    onPressed: null),
              ))
            ],
          )
        ],
      ),
    );
  }
}
