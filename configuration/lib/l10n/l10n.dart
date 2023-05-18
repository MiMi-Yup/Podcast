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

  /// `Sign up`
  String get signUp {
    return Intl.message(
      'Sign up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Login to Your Account`
  String get loginTitle {
    return Intl.message(
      'Login to Your Account',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Create Your Account`
  String get signUpTitle {
    return Intl.message(
      'Create Your Account',
      name: 'signUpTitle',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get loginSuggest {
    return Intl.message(
      'Already have an account? ',
      name: 'loginSuggest',
      desc: '',
      args: [],
    );
  }

  /// `Don't hae an account? `
  String get signUpSuggest {
    return Intl.message(
      'Don\'t hae an account? ',
      name: 'signUpSuggest',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get rememberAccount {
    return Intl.message(
      'Remember me',
      name: 'rememberAccount',
      desc: '',
      args: [],
    );
  }

  /// `Email or password is invalid`
  String get inValidInput {
    return Intl.message(
      'Email or password is invalid',
      name: 'inValidInput',
      desc: '',
      args: [],
    );
  }

  /// `Fill Your Profile`
  String get fillInfo {
    return Intl.message(
      'Fill Your Profile',
      name: 'fillInfo',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get m_continue {
    return Intl.message(
      'Continue',
      name: 'm_continue',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get fullName {
    return Intl.message(
      'Full name',
      name: 'fullName',
      desc: '',
      args: [],
    );
  }

  /// `Nickname`
  String get nickname {
    return Intl.message(
      'Nickname',
      name: 'nickname',
      desc: '',
      args: [],
    );
  }

  /// `Date of birth`
  String get dateOfBirth {
    return Intl.message(
      'Date of birth',
      name: 'dateOfBirth',
      desc: '',
      args: [],
    );
  }

  /// `Country`
  String get country {
    return Intl.message(
      'Country',
      name: 'country',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Discover`
  String get discover {
    return Intl.message(
      'Discover',
      name: 'discover',
      desc: '',
      args: [],
    );
  }

  /// `Library`
  String get library {
    return Intl.message(
      'Library',
      name: 'library',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Author`
  String get author {
    return Intl.message(
      'Author',
      name: 'author',
      desc: '',
      args: [],
    );
  }

  /// `Subscriptions`
  String get subscription {
    return Intl.message(
      'Subscriptions',
      name: 'subscription',
      desc: '',
      args: [],
    );
  }

  /// `New Updates`
  String get newUpdates {
    return Intl.message(
      'New Updates',
      name: 'newUpdates',
      desc: '',
      args: [],
    );
  }

  /// `See all`
  String get seeAll {
    return Intl.message(
      'See all',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `mins`
  String get mins {
    return Intl.message(
      'mins',
      name: 'mins',
      desc: '',
      args: [],
    );
  }

  /// `Subcribe`
  String get subcribe {
    return Intl.message(
      'Subcribe',
      name: 'subcribe',
      desc: '',
      args: [],
    );
  }

  /// `Subcribed`
  String get subcribed {
    return Intl.message(
      'Subcribed',
      name: 'subcribed',
      desc: '',
      args: [],
    );
  }

  /// `Share`
  String get share {
    return Intl.message(
      'Share',
      name: 'share',
      desc: '',
      args: [],
    );
  }

  /// `Report`
  String get report {
    return Intl.message(
      'Report',
      name: 'report',
      desc: '',
      args: [],
    );
  }

  /// `show more`
  String get showMore {
    return Intl.message(
      'show more',
      name: 'showMore',
      desc: '',
      args: [],
    );
  }

  /// `show less`
  String get showLess {
    return Intl.message(
      'show less',
      name: 'showLess',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
      desc: '',
      args: [],
    );
  }

  /// `Mark done`
  String get markDone {
    return Intl.message(
      'Mark done',
      name: 'markDone',
      desc: '',
      args: [],
    );
  }

  /// `Clear`
  String get clear {
    return Intl.message(
      'Clear',
      name: 'clear',
      desc: '',
      args: [],
    );
  }

  /// `Sort by Name`
  String get sortByName {
    return Intl.message(
      'Sort by Name',
      name: 'sortByName',
      desc: '',
      args: [],
    );
  }

  /// `Sort by Podcasts`
  String get sortByPodcast {
    return Intl.message(
      'Sort by Podcasts',
      name: 'sortByPodcast',
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
