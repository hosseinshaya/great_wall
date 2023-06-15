import 'dart:ui' as ui;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../common/styles/fonts.dart';

extension LocaleHelper on Locale {
  String get languageName {
    //TODO(hossein): get name from tr()
    switch (languageCode) {
      case 'fa':
        return 'فارسی';
      case 'en':
        return 'English';
      case 'ar':
        return 'العربية';
    }
    return 'ERR';
  }
}

extension LocaleUtils on BuildContext {
  bool get isEn => locale.languageCode == 'en';

  bool get isFa => locale.languageCode == 'fa';

  bool get isAr => locale.languageCode == 'ar';

  bool get isRtl => isFa || isAr;

  bool get isLtr => !isRtl;

  ui.TextDirection get localeDirection =>
      isRtl ? ui.TextDirection.rtl : ui.TextDirection.ltr;

  ui.TextDirection get invertLocaleDirection =>
      isRtl ? ui.TextDirection.ltr : ui.TextDirection.rtl;

  String get localeNumericFont => isFa ? Fonts.iranSansXFaNum : Fonts.iranSansX;
}
