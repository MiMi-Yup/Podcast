import 'dart:async';

import 'package:configuration/environment/build_config.dart';
import 'package:configuration/environment/env.dart';
import 'package:configuration/route/route_define.dart';
import 'package:configuration/style/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:join_podcast/data/session_info.dart';
import 'package:join_podcast/di/di.dart';
import 'package:join_podcast/domain/repositories/user_repository.dart';
import 'manifest.dart';
import 'presentation/main/main_application.dart';

const env = String.fromEnvironment('env', defaultValue: CustomEnv.prod);

/// EndPoint default
main() {
  SetupEnv();
}

class SetupEnv extends Env {
  @override
  Future? onInjection() async {
    configureDependencies(env: env);
  }

  @override
  FutureOr<void> onCreate() async {
    initRoute(routerIds);
    final previousSession = getIt<SessionInfo>();
    await previousSession.init();
    if (previousSession.token != null && previousSession.token!.isNotEmpty) {
      await getIt<UserRepository>().getCurrentUser().then((value) {
        if (value?.toModel() != null) {
          previousSession.login(
              token: previousSession.token!,
              remember: true,
              user: value?.toModel());
        } else {
          previousSession.logout();
        }
      }).onError((error, stackTrace) {
        previousSession.logout();
      });
    }
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    setStyleDefault();
  }

  @override
  Widget onCreateView() {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
      return Container(color: Colors.transparent);
    };
    return const MainApplication();
  }
}
