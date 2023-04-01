import 'package:configuration/l10n/l10n.dart';
import 'package:configuration/route/route_define.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:where_my_team/presentation/home_page/home_page_route.dart';
import 'package:get/get.dart';
import 'package:where_my_team/manifest.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

class MainApplication extends StatefulWidget {
  const MainApplication({Key? key}) : super(key: key);
  @override
  _MainApplicationState createState() => _MainApplicationState();
}

class _MainApplicationState extends State<MainApplication>
    with WidgetsBindingObserver {
  bool canPopDialog = false;

  final route = routerIds[HomePageRoute];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  /// inactive - The application is in an inactive state and is not receiving user input. iOS only
  /// paused - The application is not currently visible to the user, not responding to user input, and running in the background.
  /// resumed - The application is visible and responding to user input.
  /// suspending - The application will be suspended momentarily. Android only
  @override
  didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        break;
      case AppLifecycleState.paused:
        break;
      default:
        break;
    }
  }

  @override
  Future<bool> didPopRoute() async {
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      scaffoldMessengerKey: rootScaffoldMessengerKey,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        MultiLanguage.delegate,
      ],
      supportedLocales: MultiLanguage.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en'),
      initialRoute: route,
      onGenerateRoute: (settings) =>
          manifest(
            generateRoutes,
            settings,
          ),
    );
  }
}