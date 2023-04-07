// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class MultiLanguage {
  MultiLanguage();

  static MultiLanguage? _current;

  static MultiLanguage get current {
    assert(_current != null,
        'No instance of MultiLanguage was loaded. Try to initialize the MultiLanguage delegate before accessing MultiLanguage.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<MultiLanguage> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = MultiLanguage();
      MultiLanguage._current = instance;

      return instance;
    });
  }

  static MultiLanguage of(BuildContext context) {
    final instance = MultiLanguage.maybeOf(context);
    assert(instance != null,
        'No instance of MultiLanguage present in the widget tree. Did you add MultiLanguage.delegate in localizationsDelegates?');
    return instance!;
  }

  static MultiLanguage? maybeOf(BuildContext context) {
    return Localizations.of<MultiLanguage>(context, MultiLanguage);
  }

  /// `Database exception`
  String get databaseException {
    return Intl.message(
      'Database exception',
      name: 'databaseException',
      desc: '',
      args: [],
    );
  }

  /// `Cancelled`
  String get cancelled {
    return Intl.message(
      'Cancelled',
      name: 'cancelled',
      desc: '',
      args: [],
    );
  }

  /// `Connect timeout`
  String get connectTimeout {
    return Intl.message(
      'Connect timeout',
      name: 'connectTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Receive timeout`
  String get receiveTimeout {
    return Intl.message(
      'Receive timeout',
      name: 'receiveTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Send timeout`
  String get sendTimeout {
    return Intl.message(
      'Send timeout',
      name: 'sendTimeout',
      desc: '',
      args: [],
    );
  }

  /// `Không có kết nối mạng`
  String get connectionProblem {
    return Intl.message(
      'Không có kết nối mạng',
      name: 'connectionProblem',
      desc: '',
      args: [],
    );
  }

  /// `Vui lòng kiểm tra lại tín hiệu Wifi hoặc 3G/4G của bạn.`
  String get connectionProblemDesc {
    return Intl.message(
      'Vui lòng kiểm tra lại tín hiệu Wifi hoặc 3G/4G của bạn.',
      name: 'connectionProblemDesc',
      desc: '',
      args: [],
    );
  }

  /// `Server not found`
  String get serverNotFound {
    return Intl.message(
      'Server not found',
      name: 'serverNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Hệ thống có chút vấn đề`
  String get serverUnknownError {
    return Intl.message(
      'Hệ thống có chút vấn đề',
      name: 'serverUnknownError',
      desc: '',
      args: [],
    );
  }

  /// `Get setting`
  String get getSetting {
    return Intl.message(
      'Get setting',
      name: 'getSetting',
      desc: '',
      args: [],
    );
  }

  /// `Something wrong! Please try later.`
  String get systemError {
    return Intl.message(
      'Something wrong! Please try later.',
      name: 'systemError',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Try it`
  String get tryIt {
    return Intl.message(
      'Try it',
      name: 'tryIt',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `or continue with`
  String get otherLogin {
    return Intl.message(
      'or continue with',
      name: 'otherLogin',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<MultiLanguage> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<MultiLanguage> load(Locale locale) => MultiLanguage.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
