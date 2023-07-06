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

  /// `Don't have an account? `
  String get signUpSuggest {
    return Intl.message(
      'Don\'t have an account? ',
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

  /// `Upload`
  String get upload {
    return Intl.message(
      'Upload',
      name: 'upload',
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

  /// `Subscribe`
  String get subscribe {
    return Intl.message(
      'Subscribe',
      name: 'subscribe',
      desc: '',
      args: [],
    );
  }

  /// `Subscribed`
  String get subscribed {
    return Intl.message(
      'Subscribed',
      name: 'subscribed',
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

  /// `English`
  String get languageName {
    return Intl.message(
      'English',
      name: 'languageName',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: '',
      args: [],
    );
  }

  /// `Downloads`
  String get downloads {
    return Intl.message(
      'Downloads',
      name: 'downloads',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Dark Theme`
  String get darkTheme {
    return Intl.message(
      'Dark Theme',
      name: 'darkTheme',
      desc: '',
      args: [],
    );
  }

  /// `Help Center`
  String get helpCenter {
    return Intl.message(
      'Help Center',
      name: 'helpCenter',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get confirm {
    return Intl.message(
      'Yes',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `After {day} day(s)`
  String after(int day) {
    return Intl.message(
      'After $day day(s)',
      name: 'after',
      desc: 'Day do something',
      args: [day],
    );
  }

  /// `Downloaded`
  String get downloaded {
    return Intl.message(
      'Downloaded',
      name: 'downloaded',
      desc: '',
      args: [],
    );
  }

  /// `Global Settings`
  String get globalSettings {
    return Intl.message(
      'Global Settings',
      name: 'globalSettings',
      desc: '',
      args: [],
    );
  }

  /// `Auto Download New Episodes`
  String get autoDownload {
    return Intl.message(
      'Auto Download New Episodes',
      name: 'autoDownload',
      desc: '',
      args: [],
    );
  }

  /// `Download Only if Connected to Wi-Fi`
  String get downloadIfWifi {
    return Intl.message(
      'Download Only if Connected to Wi-Fi',
      name: 'downloadIfWifi',
      desc: '',
      args: [],
    );
  }

  /// `Remove Completed Episodes`
  String get removeCompletedAfter {
    return Intl.message(
      'Remove Completed Episodes',
      name: 'removeCompletedAfter',
      desc: '',
      args: [],
    );
  }

  /// `Remove Unfinished Episodes`
  String get removeUnfinishedAfter {
    return Intl.message(
      'Remove Unfinished Episodes',
      name: 'removeUnfinishedAfter',
      desc: '',
      args: [],
    );
  }

  /// `About It:`
  String get about_product {
    return Intl.message(
      'About It:',
      name: 'about_product',
      desc: '',
      args: [],
    );
  }

  /// `Background Music`
  String get background_music {
    return Intl.message(
      'Background Music',
      name: 'background_music',
      desc: '',
      args: [],
    );
  }

  /// `Episode`
  String get episode {
    return Intl.message(
      'Episode',
      name: 'episode',
      desc: '',
      args: [],
    );
  }

  /// `Apply`
  String get apply {
    return Intl.message(
      'Apply',
      name: 'apply',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message(
      'Reset',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `Speed`
  String get speed {
    return Intl.message(
      'Speed',
      name: 'speed',
      desc: '',
      args: [],
    );
  }

  /// `Reminder`
  String get reminder {
    return Intl.message(
      'Reminder',
      name: 'reminder',
      desc: '',
      args: [],
    );
  }

  /// `Record`
  String get record {
    return Intl.message(
      'Record',
      name: 'record',
      desc: '',
      args: [],
    );
  }

  /// `Verify new user`
  String get verifyCreate {
    return Intl.message(
      'Verify new user',
      name: 'verifyCreate',
      desc: '',
      args: [],
    );
  }

  /// `Fotgot password`
  String get forgotAccount {
    return Intl.message(
      'Fotgot password',
      name: 'forgotAccount',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Email invalid`
  String get emailInvalid {
    return Intl.message(
      'Email invalid',
      name: 'emailInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Forgot the password?`
  String get forgotTheAccount {
    return Intl.message(
      'Forgot the password?',
      name: 'forgotTheAccount',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Code have been send to`
  String get codeHaveBeenSend {
    return Intl.message(
      'Code have been send to',
      name: 'codeHaveBeenSend',
      desc: '',
      args: [],
    );
  }

  /// `Code invalid`
  String get codeInvalid {
    return Intl.message(
      'Code invalid',
      name: 'codeInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Subscribe Authors`
  String get initSubscribeTitle {
    return Intl.message(
      'Subscribe Authors',
      name: 'initSubscribeTitle',
      desc: '',
      args: [],
    );
  }

  /// `Subscribe your favorite Podcast Authors. Or you can skip it for now.`
  String get initSubscribe {
    return Intl.message(
      'Subscribe your favorite Podcast Authors. Or you can skip it for now.',
      name: 'initSubscribe',
      desc: '',
      args: [],
    );
  }

  /// `Choose Your Interest`
  String get chooseInterestTitle {
    return Intl.message(
      'Choose Your Interest',
      name: 'chooseInterestTitle',
      desc: '',
      args: [],
    );
  }

  /// `Choose your interests and get the best podcast recommendations. Don't worry, you can always change it later.`
  String get chooseInterest {
    return Intl.message(
      'Choose your interests and get the best podcast recommendations. Don\'t worry, you can always change it later.',
      name: 'chooseInterest',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message(
      'Verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to log out?`
  String get askLogout {
    return Intl.message(
      'Are you sure you want to log out?',
      name: 'askLogout',
      desc: '',
      args: [],
    );
  }

  /// `Favourite`
  String get favourite {
    return Intl.message(
      'Favourite',
      name: 'favourite',
      desc: '',
      args: [],
    );
  }

  /// `Playlist`
  String get playlist {
    return Intl.message(
      'Playlist',
      name: 'playlist',
      desc: '',
      args: [],
    );
  }

  /// `History`
  String get history {
    return Intl.message(
      'History',
      name: 'history',
      desc: '',
      args: [],
    );
  }

  /// `User name`
  String get username {
    return Intl.message(
      'User name',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Good Morning`
  String get goodMorning {
    return Intl.message(
      'Good Morning',
      name: 'goodMorning',
      desc: '',
      args: [],
    );
  }

  /// `Good Afternoon`
  String get goodAfternoon {
    return Intl.message(
      'Good Afternoon',
      name: 'goodAfternoon',
      desc: '',
      args: [],
    );
  }

  /// `Good Evening`
  String get goodEvening {
    return Intl.message(
      'Good Evening',
      name: 'goodEvening',
      desc: '',
      args: [],
    );
  }

  /// `Good Night`
  String get goodNight {
    return Intl.message(
      'Good Night',
      name: 'goodNight',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Sort by Date`
  String get sortByDate {
    return Intl.message(
      'Sort by Date',
      name: 'sortByDate',
      desc: '',
      args: [],
    );
  }

  /// `Channel`
  String get channel {
    return Intl.message(
      'Channel',
      name: 'channel',
      desc: '',
      args: [],
    );
  }

  /// `Podcast`
  String get podcast {
    return Intl.message(
      'Podcast',
      name: 'podcast',
      desc: '',
      args: [],
    );
  }

  /// `Pause`
  String get pause {
    return Intl.message(
      'Pause',
      name: 'pause',
      desc: '',
      args: [],
    );
  }

  /// `Play`
  String get play {
    return Intl.message(
      'Play',
      name: 'play',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get completed {
    return Intl.message(
      'Completed',
      name: 'completed',
      desc: '',
      args: [],
    );
  }

  /// `Search and find out...`
  String get hintSearch {
    return Intl.message(
      'Search and find out...',
      name: 'hintSearch',
      desc: '',
      args: [],
    );
  }

  /// `Empty`
  String get empty {
    return Intl.message(
      'Empty',
      name: 'empty',
      desc: '',
      args: [],
    );
  }

  /// `Shuffle Play`
  String get shufflePlay {
    return Intl.message(
      'Shuffle Play',
      name: 'shufflePlay',
      desc: '',
      args: [],
    );
  }

  /// `Rename`
  String get rename {
    return Intl.message(
      'Rename',
      name: 'rename',
      desc: '',
      args: [],
    );
  }

  /// `Download All`
  String get downloadAll {
    return Intl.message(
      'Download All',
      name: 'downloadAll',
      desc: '',
      args: [],
    );
  }

  /// `Timer`
  String get timer {
    return Intl.message(
      'Timer',
      name: 'timer',
      desc: '',
      args: [],
    );
  }

  /// `Remove from this playlist`
  String get removeFromPlaylist {
    return Intl.message(
      'Remove from this playlist',
      name: 'removeFromPlaylist',
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
      Locale.fromSubtags(languageCode: 'vi'),
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
