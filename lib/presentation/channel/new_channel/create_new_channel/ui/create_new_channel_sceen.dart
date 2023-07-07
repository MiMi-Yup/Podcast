import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:join_podcast/presentation/channel/new_channel/create_name_and_description/createNameAndDescription.dart';
import 'package:join_podcast/presentation/channel/new_channel/create_new_channel/cubit/create_new_channel_cubit.dart';

class CreateNewChannelScreen extends StatelessWidget {
  CreateNewChannelScreen({super.key});

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Channel'),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: BlocBuilder<CreateNewChannelCubit, CreateNewChannelState>(
              builder: (context, state) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 80.0,
                      foregroundImage: state.avatar == null ?
                      NetworkImage(state.initAvatar)
                    : NetworkImage(state.avatar!),
                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    SizedBox(height: 20.0),
                    Text(
                      'Enter Channel Name:',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 10.0),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 40.0),
                      child: TextField(
                        controller: _textEditingController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Channel Name',
                        ),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        // TODO: Xử lý sự kiện khi nhấn nút Create Channel
                        context.read<CreateNewChannelCubit>().setChannel(_textEditingController.text);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const CreateNameAndDescription()));
                      },
                      child: Text('Create Channel'),
                    ),
                  ],
                )
            ),
          ),
        ],
      ),
    );
  }
}