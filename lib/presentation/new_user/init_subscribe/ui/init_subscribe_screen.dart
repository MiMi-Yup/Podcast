import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/common/widgets/m_author_subscribe.dart';
import 'package:join_podcast/common/widgets/m_primary_button.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/bottom_bar/bottom_bar_route.dart';
import 'package:join_podcast/presentation/new_user/init_subscribe/cubit/init_subscribe_cubit.dart';
import 'package:join_podcast/presentation/podcast/podcast_route.dart';
import 'package:join_podcast/utils/alert_util.dart';

class InitSubscribeScreen extends StatelessWidget {
  const InitSubscribeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(MultiLanguage.of(context).initSubscribeTitle),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              MultiLanguage.of(context).initSubscribe,
              style: mST18R,
            ),
          ),
          Expanded(
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.all(10.0),
              itemBuilder: (context, index) => MAuthorSubscribe(
                author: "Trân trọng bản thân mỗi ngày",
                quantity: 2,
                networkImage:
                    "https://www.rd.com/wp-content/uploads/2021/05/GettyImages-1271148946-e1620838088898.jpg?resize=700,467",
                onPressed: () => XMDRouter.pushNamed(routerIds[PodcastRoute]!,
                    arguments: {index: index}),
                toggleSubscribe: (value) {
                  if (value) {
                    context
                        .read<InitSubscribeCubit>()
                        .addSubscribe(index.toString());
                  } else {
                    context
                        .read<InitSubscribeCubit>()
                        .removeSubscribe(index.toString());
                  }
                },
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: 16.0,
              ),
              itemCount: 1,
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
                        XMDRouter.popAndPushNamed(routerIds[BottomBarRoute]!),
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
                      await context
                          .read<InitSubscribeCubit>()
                          .updateSubscribe();
                      AlertUtil.hideLoading();
                      XMDRouter.popAndPushNamed(routerIds[BottomBarRoute]!);
                    }),
              ))
            ],
          )
        ],
      ),
    );
  }
}
