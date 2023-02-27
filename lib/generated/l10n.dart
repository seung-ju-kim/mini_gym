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

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Sign up for MiniGym`
  String get signUpTitle {
    return Intl.message(
      'Sign up for MiniGym',
      name: 'signUpTitle',
      desc: '',
      args: [],
    );
  }

  /// `Create a profile, make your own routines`
  String get signUpSubtitle {
    return Intl.message(
      'Create a profile, make your own routines',
      name: 'signUpSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up with Email & Password`
  String get signUpWithEmailAndPassword {
    return Intl.message(
      'Sign Up with Email & Password',
      name: 'signUpWithEmailAndPassword',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Apple`
  String get signUpWithApple {
    return Intl.message(
      'Continue with Apple',
      name: 'signUpWithApple',
      desc: '',
      args: [],
    );
  }

  /// `Do you already have an account?`
  String get alreadyHaveAnAccount {
    return Intl.message(
      'Do you already have an account?',
      name: 'alreadyHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get login {
    return Intl.message(
      'Log In',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Log in for MiniGym`
  String get loginTitle {
    return Intl.message(
      'Log in for MiniGym',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Keep a record of your exercise`
  String get loginSubtitle {
    return Intl.message(
      'Keep a record of your exercise',
      name: 'loginSubtitle',
      desc: '',
      args: [],
    );
  }

  /// `Login with Email & Password`
  String get loginWithEmailAndPassword {
    return Intl.message(
      'Login with Email & Password',
      name: 'loginWithEmailAndPassword',
      desc: '',
      args: [],
    );
  }

  /// `Login with Apple`
  String get loginWithApple {
    return Intl.message(
      'Login with Apple',
      name: 'loginWithApple',
      desc: '',
      args: [],
    );
  }

  /// `Don't you have an account yet?`
  String get dontHaveAnAccount {
    return Intl.message(
      'Don\'t you have an account yet?',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signup {
    return Intl.message(
      'Sign Up',
      name: 'signup',
      desc: '',
      args: [],
    );
  }

  /// `What is Email to use?`
  String get whatIsYourEmail {
    return Intl.message(
      'What is Email to use?',
      name: 'whatIsYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `email`
  String get email {
    return Intl.message(
      'email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get password {
    return Intl.message(
      'password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `password required:`
  String get passwordRequirement {
    return Intl.message(
      'password required:',
      name: 'passwordRequirement',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enterPassword {
    return Intl.message(
      'Enter your password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `8 to 20 characters`
  String get passwordCondition1 {
    return Intl.message(
      '8 to 20 characters',
      name: 'passwordCondition1',
      desc: '',
      args: [],
    );
  }

  /// `numbers, letters, and special characters`
  String get passwordCondition2 {
    return Intl.message(
      'numbers, letters, and special characters',
      name: 'passwordCondition2',
      desc: '',
      args: [],
    );
  }

  /// `Password is too weak`
  String get passwordIsWeak {
    return Intl.message(
      'Password is too weak',
      name: 'passwordIsWeak',
      desc: '',
      args: [],
    );
  }

  /// `Email is already in use`
  String get emailAlreadyInUse {
    return Intl.message(
      'Email is already in use',
      name: 'emailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `Email is Not valid`
  String get emailIsNotValid {
    return Intl.message(
      'Email is Not valid',
      name: 'emailIsNotValid',
      desc: '',
      args: [],
    );
  }

  /// `Email is not registered`
  String get notRegisteredEmail {
    return Intl.message(
      'Email is not registered',
      name: 'notRegisteredEmail',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password`
  String get wrongPassword {
    return Intl.message(
      'Wrong password',
      name: 'wrongPassword',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ko'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
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
