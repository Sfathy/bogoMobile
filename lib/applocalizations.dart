import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


import 'l10n/messages_all.dart';

class AppLocalizations {
  static Future<AppLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode == null ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return new AppLocalizations();
    });
  }

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  String get title {
    return Intl.message('Hello world App',
        name: 'title', desc: 'The application title');
  }

  String get or {
    return Intl.message('OR', name: 'or');
  }
  String get email {
    return Intl.message('Email', name: 'email');
  }
  String get password {
    return Intl.message('Password', name: 'password');
  }
  String get haveAccount {
    return Intl.message('haveAccount', name: 'haveAccount');
  }
  String get error {
    return Intl.message('Error', name: 'error');
  }
  String get ok {
    return Intl.message('Ok', name: 'ok');
  }
  String get loginWithFB {
    return Intl.message('loginWithFB', name: 'loginWithFB');
  }
  String get loginWithGoogle {
    return Intl.message('loginWithGoogle', name: 'loginWithGoogle');
  }

   String get login {
    return Intl.message('login', name: 'login');
  }
   String get signup {
    return Intl.message('Signup', name: 'signup');
  }
  //OR SKIP
    String get orSkip {
    return Intl.message('OR Skip', name: 'orSkip');
  }
  //Get best product in treva shop
    String get desc {
    return Intl.message('Get best product in treva shop', name: 'desc');
  } 
}

class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  //const AppLocalizationsDelegate();
  final Locale overriddenLocale;
  AppLocalizationsDelegate(this.overriddenLocale);
  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) {
    return AppLocalizations.load(locale);
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }
}