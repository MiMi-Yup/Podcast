import 'package:chips_choice/chips_choice.dart';
import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/common/widgets/m_primary_button.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/new_user/init_subscribe/init_subscribe_route.dart';
import 'package:join_podcast/presentation/new_user/interest/cubit/interest_cubit.dart';
import 'package:join_podcast/utils/alert_util.dart';

class InterestScreen extends StatelessWidget {
  InterestScreen({super.key});

  final List<String> listInterest = [
    "News",
    "Comedy",
    "Society",
    "Culture",
    "Business",
    "Sport",
    "Health",
    "Motivation",
    "Art",
    "Drame",
    "Politics",
    "Religion",
    "True Crime",
    "History",
    "Kids",
    "Educational",
    "Science",
    "Law",
    "Film & TV",
    "Religious",
    "Tech",
    "Feminist",
    "Gaming",
    "Crime"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(MultiLanguage.of(context).chooseInterestTitle),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              MultiLanguage.of(context).chooseInterest,
              style: mST18R,
            ),
          ),
          BlocBuilder<InterestCubit, InterestState>(
            buildWhen: (previous, current) =>
                previous.interested != current.interested,
            builder: (context, state) => ChipsChoice.multiple(
                value: state.interested.toList(),
                onChanged: (value) =>
                    context.read<InterestCubit>().changeInterest(value),
                choiceItems: C2Choice.listFrom<String, String>(
                  source: listInterest,
                  value: (i, v) => v,
                  label: (i, v) => v,
                  tooltip: (i, v) => v,
                ),
                choiceCheckmark: true,
                wrapped: true,
                runSpacing: 20,
                choiceStyle: C2ChipStyle.filled(
                  borderWidth: 2,
                  color: Colors.blueGrey,
                  foregroundColor: Colors.white,
                  selectedStyle: C2ChipStyle(
                    borderColor: mCPrimary,
                    foregroundColor: Colors.white,
                    foregroundStyle:
                        const TextStyle(fontWeight: FontWeight.bold),
                    overlayColor: mCPrimary,
                    backgroundColor: mCPrimary,
                    checkmarkColor: Colors.white,
                  ),
                )),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MPrimaryButton(
                    text: MultiLanguage.of(context).skip,
                    onPressed: () => XMDRouter.popAndPushNamed(
                        routerIds[InitSubscribeRoute]!),
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
                    onPressed: () async {
                      AlertUtil.showLoading();
                      await context.read<InterestCubit>().updateInterest();
                      AlertUtil.hideLoading();
                      XMDRouter.popAndPushNamed(routerIds[InitSubscribeRoute]!);
                    }),
              ))
            ],
          )
        ],
      ),
    );
  }
}
