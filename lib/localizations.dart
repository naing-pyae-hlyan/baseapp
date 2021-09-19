import 'package:flutter/foundation.dart' show SynchronousFuture;
import 'lib_exp.dart';

extension StringExtensions on String {
  String get lz => navigatorKey.currentContext == null
      ? this
      : AppLocalizations.of(navigatorKey.currentContext!).get(this);
}

class AppLocalizations {
  AppLocalizations(this.locale);
  final Locale locale;

  static AppLocalizations of(BuildContext context) =>
      Localizations.of<AppLocalizations>(context, AppLocalizations)!;

  static final Map<String, Map<String, String>> _localizedValue = {
    '': {
      'en': '',
      'zh': '',
      'th': '',
      'mm': '',
    },
  };

  String get(String key) {
    try {
      return _localizedValue[key]![locale.languageCode]!;
    } catch (_) {
      return key;
    }
  }
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    throw UnimplementedError();
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<AppLocalizations>(AppLocalizations(locale));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) =>
      false;
}
