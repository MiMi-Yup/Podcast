import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlayerStorageService with WidgetsBindingObserver {
  static const String _keyIsPlaying = 'isPlaying';
  static const String _keyIdEpisode = 'idEpisode';

  Future<void> setIsPlaying(bool isPlaying) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_keyIsPlaying, isPlaying);
  }

  Future<bool> getIsPlaying() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_keyIsPlaying) ?? false;
  }

  Future<void> setIdEpisode(String idEpisode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyIdEpisode, idEpisode);
  }

  Future<String?> getIdEpisode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyIdEpisode);
  }

  // PlayerStorageService() {
  //   WidgetsBinding.instance.addObserver(this);
  // }

  // @override
  // void didChangeAppLifecycleState(AppLifecycleState state) {
  //   if (state == AppLifecycleState.paused) {
  //     setIsPlaying(false);
  //   }
  // }
}
