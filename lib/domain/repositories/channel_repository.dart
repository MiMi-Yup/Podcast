import 'dart:async';

import 'package:join_podcast/models/request/auth/login_user_request.dart';
import 'package:join_podcast/models/request/auth/new_user_request.dart';
import 'package:join_podcast/models/request/auth/reset_user_request.dart';
import 'package:join_podcast/models/request/auth/verify_user_request.dart';
import 'package:join_podcast/models/response/auth/login_user_response.dart';
import 'package:join_podcast/models/response/auth/reset_token_response.dart';

import '../../models/request/channel/create_channel_request.dart';

abstract class ChannelRepository{
  FutureOr<bool?> createChannel(ChannelCreateRequest createChannel);
}