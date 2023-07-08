import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/route/xmd_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/manifest.dart';
import 'package:join_podcast/presentation/channel/new_channel/create_name_and_description/cubit/createNameAndDescription_cubit.dart';
import 'package:join_podcast/presentation/channel/new_podcast/editPodcast/editPodcast_route.dart';

import '../../../../../common/widgets/m_podcast_component.dart';
import '../../../new_podcast/createNewPodcast/createNewPodcast_route.dart';

class CreateNameAndDescriptionScreen extends StatelessWidget {
  const CreateNameAndDescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CreateNameAndDescriptionCubit>().init();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        title: Text(MultiLanguage.of(context).manageChannel),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(context
                          .read<CreateNameAndDescriptionCubit>()
                          .avatar!),
                      radius: 40,
                    ),
                    SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context
                                  .read<CreateNameAndDescriptionCubit>()
                                  .channelName ??
                              MultiLanguage().username,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        BlocBuilder<CreateNameAndDescriptionCubit,
                                CreateNameAndDescriptionState>(
                            buildWhen: (previous, current) =>
                                previous.countListened !=
                                    current.countListened ||
                                previous.countPodcast != current.countPodcast,
                            builder: (context, state) => Text(
                                '${state.countPodcast} ${MultiLanguage.of(context).podcast} • ${state.countListened} ${MultiLanguage.of(context).listens}')),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  MultiLanguage.of(context).myPodcast,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<CreateNameAndDescriptionCubit,
              CreateNameAndDescriptionState>(
            buildWhen: (previous, current) =>
                previous.podcasts != current.podcasts,
            builder: (context, state) => ListView.separated(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 15.0),
              itemBuilder: (context, index) {
                return PodcastComponent(
                  title: state.podcasts?[index].name ?? '',
                  author: state.podcasts?[index].description ?? '',
                  networkImage: state.podcasts?[index].image,
                  episodes: state.podcasts?[index].count ?? 0,
                  listens: state.podcasts?[index].episodes
                          ?.where((element) => element.isListened == true)
                          .length ??
                      0,
                  onPressed: () => XMDRouter.pushNamed(
                      routerIds[EditPodcastRoute]!,
                      arguments: {'id': state.podcasts?[index].id}),
                  // Truyền các giá trị cần thiết vào component podcast
                );
              },
              separatorBuilder: (BuildContext context, int index) => SizedBox(
                height: 16.0,
              ),
              itemCount: state.podcasts?.length ?? 0,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle create podcast button pressed
          XMDRouter.pushNamed(routerIds[CreateNewPodcastRoute]!);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
