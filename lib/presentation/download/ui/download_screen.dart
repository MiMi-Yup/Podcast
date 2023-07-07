import 'package:configuration/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/common/widgets/m_button_setting.dart';
import 'package:join_podcast/common/widgets/m_do_after_modal.dart';
import 'package:join_podcast/common/widgets/m_episode_component_with_event.dart';
import 'package:join_podcast/common/widgets/m_section.dart';
import 'package:join_podcast/presentation/download/cubit/download_cubit.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(MultiLanguage.of(context).downloads),
      ),
      body: FutureBuilder(
          future: context.read<DownloadCubit>().loadPrefs(),
          builder: (_, snapshot) => snapshot.hasData
              ? CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    MSection(
                        title: MultiLanguage.of(context).globalSettings,
                        headerColor: Theme.of(context).scaffoldBackgroundColor,
                        titleColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black,
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            BlocBuilder<DownloadCubit, DownloadState>(
                              buildWhen: (previous, current) =>
                                  previous.autoDownload != current.autoDownload,
                              builder: (context, state) => MButtonSetting(
                                title: MultiLanguage.of(context).autoDownload,
                                isSwitch: true,
                                initState: state.autoDownload,
                                onPressed: (value) => context
                                    .read<DownloadCubit>()
                                    .changeAutodownload(value ?? false),
                              ),
                            ),
                            BlocBuilder<DownloadCubit, DownloadState>(
                              buildWhen: (previous, current) =>
                                  previous.downloadIfWifi !=
                                  current.downloadIfWifi,
                              builder: (context, state) => MButtonSetting(
                                title: MultiLanguage.of(context).downloadIfWifi,
                                isSwitch: true,
                                initState: state.downloadIfWifi,
                                onPressed: (value) => context
                                    .read<DownloadCubit>()
                                    .changeDownloadWifi(value ?? false),
                              ),
                            ),
                            BlocBuilder<DownloadCubit, DownloadState>(
                              buildWhen: (previous, current) =>
                                  previous.removeCompleted !=
                                  current.removeCompleted,
                              builder: (context, state) => MButtonSetting(
                                  title: MultiLanguage.of(context)
                                      .removeCompletedAfter,
                                  subTitlte: MultiLanguage.of(context)
                                      .after(state.removeCompleted),
                                  onPressed: (_) =>
                                      showDoAfterModal<int>(context, [
                                        ItemDoAfter(
                                            title: MultiLanguage.of(context)
                                                .after(1),
                                            value: 1),
                                        ItemDoAfter(
                                            title: MultiLanguage.of(context)
                                                .after(7),
                                            value: 7),
                                        ItemDoAfter(
                                            title: MultiLanguage.of(context)
                                                .after(30),
                                            value: 30)
                                      ]).then((value) => value != null
                                          ? context
                                              .read<DownloadCubit>()
                                              .changeRemoveCompleted(value)
                                          : null)),
                            ),
                            BlocBuilder<DownloadCubit, DownloadState>(
                              buildWhen: (previous, current) =>
                                  previous.removeUnfinished !=
                                  current.removeUnfinished,
                              builder: (context, state) => MButtonSetting(
                                  title: MultiLanguage.of(context)
                                      .removeUnfinishedAfter,
                                  subTitlte: MultiLanguage.of(context)
                                      .after(state.removeUnfinished),
                                  onPressed: (_) =>
                                      showDoAfterModal<int>(context, [
                                        ItemDoAfter(
                                            title: MultiLanguage.of(context)
                                                .after(1),
                                            value: 1),
                                        ItemDoAfter(
                                            title: MultiLanguage.of(context)
                                                .after(7),
                                            value: 7),
                                        ItemDoAfter(
                                            title: MultiLanguage.of(context)
                                                .after(30),
                                            value: 30)
                                      ]).then((value) => value != null
                                          ? context
                                              .read<DownloadCubit>()
                                              .changeRemoveUnfinished(value)
                                          : null)),
                            )
                          ],
                        )).builder(),
                    MSection(
                        title: MultiLanguage.of(context).downloaded,
                        headerColor: Theme.of(context).scaffoldBackgroundColor,
                        titleColor:
                            Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black,
                        content: BlocBuilder<DownloadCubit, DownloadState>(
                          buildWhen: (previous, current) =>
                              previous.downloaded != current.downloaded,
                          builder: (context, state) => ListView.separated(
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            padding: EdgeInsets.only(left: 10.0, right: 10.0),
                            itemBuilder: (context, index) =>
                                MEpisodeComponentWithEvent(
                              data: state.downloaded[index],
                            ),
                            separatorBuilder: (context, index) => SizedBox(
                              height: 16.0,
                            ),
                            itemCount: state.downloaded.length,
                          ),
                        )).builder()
                  ],
                )
              : const LinearProgressIndicator()),
    );
  }
}
