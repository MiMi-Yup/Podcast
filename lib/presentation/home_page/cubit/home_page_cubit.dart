import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart';
import 'package:where_my_team/domain/use_cases/home_page_usecases.dart';

part 'home_page_state.dart';

@injectable
class HomePageCubit extends Cubit<HomePageState> {
  final HomepageUseCases homepageUseCases;

  HomePageCubit({
    required this.homepageUseCases,
  }) : super(Initial());

  FutureOr<Stream<LocationData>?> getStream() async {
    final Stream<LocationData>? stream =
        await homepageUseCases.getStreamLocation();
    emit(GetStream(locationStream: stream));
    // try {
    //   final res = await homepageUseCases.getSetting(param);
    //   emit(GetSettingSuccess(res?.test ?? ''));
    // } catch (e) {
    //   emit(GetSettingError());
    // }
  }

  FutureOr<void> checkPermission() async {
    homepageUseCases.checkPermission();
    // try {
    //   final res = await homepageUseCases.getSetting(param);
    //   emit(GetSettingSuccess(res?.test ?? ''));
    // } catch (e) {
    //   emit(GetSettingError());
    // }
  }
}
