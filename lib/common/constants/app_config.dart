import 'dart:ui';

class AppConfig {
  static const String baseUrl = 'https://wallhaven.cc/api/';
    static const bool debug = true;

  static const String localePath = 'resources/langs';
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en', 'US'),
  ];
  static const Locale startLocale = Locale('en', 'US');
}