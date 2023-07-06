import 'dart:async';

import 'package:join_podcast/models/request/users/change_password_request.dart';
import 'package:join_podcast/models/request/users/create_channel_request.dart';
import 'package:join_podcast/models/request/users/update_channel_request.dart';
import 'package:join_podcast/models/request/users/update_request.dart';
import 'package:join_podcast/models/response/episode/episode_response.dart';
import 'package:join_podcast/models/response/list_response.dart';
import 'package:join_podcast/models/response/users/user_response.dart';

abstract class UserRepository {
  Future<UserResponse?> getCurrentUser();
  FutureOr<bool?> changePassword(UserChangePasswordRequest request);
  FutureOr<UserResponse?> updateInfo(UserUpdateRequest request);
  FutureOr<UserResponse?> getUserById(String id);
  Future<bool?> createChannel(CreateChannelRequest request);
  Future<bool?> updateChannel(UpdateChannelRequest request);
  Future<ListResponse<EpisodeResponse>?> getHistoryEpisodes();
  Future<bool?> clearHistory();
  Future<bool?> addHistory(String idEpisode);
  Future<bool?> removeEpisodeInHistory(String idEpisode);
  Future<ListResponse<EpisodeResponse>?> getFavouriteEpisodes();
  Future<bool?> clearFavourite();
  Future<bool?> addIntoFavourite(String idEpisode);
  Future<bool?> removeEpisodeInFavourite(String idEpisode);
  Future<List<String>?> getSearchHistory();
  Future<bool?> removeSearcgHistory(String searchStr);
}
