import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:join_podcast/data/data_source/remote/user_service.dart';
import 'package:join_podcast/domain/repositories/user_repository.dart';
import 'package:join_podcast/models/request/users/change_password_request.dart';
import 'package:join_podcast/models/request/users/update_channel_request.dart';
import 'package:join_podcast/models/request/users/create_channel_request.dart';
import 'package:join_podcast/models/request/users/update_request.dart';
import 'package:join_podcast/models/response/channel/channel_response.dart';
import 'package:join_podcast/models/response/list_response.dart';
import 'package:join_podcast/models/response/episode/episode_response.dart';
import 'package:join_podcast/models/response/list_seperate_response.dart';
import 'package:join_podcast/models/response/podcasts/podcast_response.dart';
import 'package:join_podcast/models/response/users/user_response.dart';
import 'package:join_podcast/utils/exception_util.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserService userService;
  UserRepositoryImpl({required this.userService});

  @override
  Future<UserResponse?> getCurrentUser() {
    return userService
        .getCurrentProfile()
        .then((value) => value.data)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return null;
    });
  }

  @override
  FutureOr<bool?> changePassword(UserChangePasswordRequest request) {
    return userService
        .changePassword(request)
        .then((value) => true)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return false;
    });
  }

  @override
  FutureOr<UserResponse?> getUserById(String id) {
    return userService
        .getUserById(id)
        .then((value) => value.data)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return null;
    });
  }

  @override
  FutureOr<UserResponse?> updateInfo(UserUpdateRequest request) {
    return userService
        .updateUser(request)
        .then((value) => value.data)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return null;
    });
  }

  @override
  Future<bool?> addHistory(String idEpisode) {
    return userService
        .addHistory(idEpisode)
        .then((value) => true)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return false;
    });
  }

  @override
  Future<bool?> addIntoFavourite(String idEpisode) {
    return userService
        .addIntoFavourite(idEpisode)
        .then((value) => true)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return false;
    });
  }

  @override
  Future<bool?> clearFavourite() {
    return userService
        .clearFavourite()
        .then((value) => true)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return false;
    });
  }

  @override
  Future<bool?> clearHistory() {
    return userService
        .clearHistory()
        .then((value) => true)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return false;
    });
  }

  @override
  Future<bool?> createChannel(CreateChannelRequest request) {
    return userService
        .createChannel(request)
        .then((value) => true)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return false;
    });
  }

  @override
  Future<ListResponse<EpisodeResponse>?> getFavouriteEpisodes() {
    return userService
        .getFavouriteEpisodes()
        .then((value) => value.data)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return null;
    });
  }

  @override
  Future<ListResponse<EpisodeResponse>?> getHistoryEpisodes() {
    return userService
        .getHistoryEpisodes()
        .then((value) => value.data)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return null;
    });
  }

  @override
  Future<bool?> removeEpisodeInFavourite(String idEpisode) {
    return userService
        .removeFavouriteById(idEpisode)
        .then((value) => true)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return false;
    });
  }

  @override
  Future<bool?> removeEpisodeInHistory(String idEpisode) {
    return userService
        .removeHistoryById(idEpisode)
        .then((value) => true)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return false;
    });
  }

  @override
  Future<bool?> updateChannel(UpdateChannelRequest request) {
    return userService
        .updateChannel(request)
        .then((value) => true)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return false;
    });
  }

  @override
  Future<List<String>?> getSearchHistory() {
    return userService
        .getSearchHistory()
        .then((value) => value.data)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return null;
    });
  }

  @override
  Future<bool?> removeSearchHistory(String searchStr) {
    return userService
        .removeSearchHistory(searchStr)
        .then((value) => true)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return false;
    });
  }

  @override
  Future<ChannelResponse?> getChannelByIdUser({required String userId}) {
    return userService
        .getChannelByIdUser(userId)
        .then((value) => value.data)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return null;
    });
  }

  @override
  Future<ChannelResponse?> getSelfChannel() {
    return userService
        .getSelfChannel()
        .then((value) => value.data)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return null;
    });
  }

  @override
  Future<ListSeperateResponse<PodcastResponse>?> getSubcribed(
      {int? limit, int? offset}) {
    return userService
        .getSubcribedPodcasts(limit, offset)
        .then((value) => value.data)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return null;
    });
  }

  @override
  Future<ListSeperateResponse<UserResponse>?> search(String query,
      {int? limit, int? offset}) {
    return userService
        .search(query, limit, offset)
        .then((value) => value.data)
        .catchError((onError) {
      ExceptionUtil.handle(onError);
      return null;
    });
  }
}
