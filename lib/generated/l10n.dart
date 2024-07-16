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

  /// `Sign in`
  String get signin {
    return Intl.message(
      'Sign in',
      name: 'signin',
      desc: '',
      args: [],
    );
  }

  /// `Email Addres`
  String get emailAddres {
    return Intl.message(
      'Email Addres',
      name: 'emailAddres',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueText {
    return Intl.message(
      'Continue',
      name: 'continueText',
      desc: '',
      args: [],
    );
  }

  /// `Dont have an Account ?`
  String get dontHaveAnAccount {
    return Intl.message(
      'Dont have an Account ?',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create One`
  String get createOne {
    return Intl.message(
      'Create One',
      name: 'createOne',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Apple`
  String get continueWithApple {
    return Intl.message(
      'Continue with Apple',
      name: 'continueWithApple',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Google`
  String get continueWithGoogle {
    return Intl.message(
      'Continue with Google',
      name: 'continueWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Facebook`
  String get continueWithFacebook {
    return Intl.message(
      'Continue with Facebook',
      name: 'continueWithFacebook',
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

  /// `Forgot Password ?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password ?',
      name: 'forgotPassword',
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

  /// `Enter Email address`
  String get enterEmailAddress {
    return Intl.message(
      'Enter Email address',
      name: 'enterEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Create Account `
  String get createAccount {
    return Intl.message(
      'Create Account ',
      name: 'createAccount',
      desc: '',
      args: [],
    );
  }

  /// `Firstname`
  String get firstname {
    return Intl.message(
      'Firstname',
      name: 'firstname',
      desc: '',
      args: [],
    );
  }

  /// `Lastname`
  String get lastname {
    return Intl.message(
      'Lastname',
      name: 'lastname',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get emailAddress {
    return Intl.message(
      'Email Address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Return to Login`
  String get returnToLogin {
    return Intl.message(
      'Return to Login',
      name: 'returnToLogin',
      desc: '',
      args: [],
    );
  }

  /// `We Sent you an Email to `
  String get weSentYouAnEmailTo {
    return Intl.message(
      'We Sent you an Email to ',
      name: 'weSentYouAnEmailTo',
      desc: '',
      args: [],
    );
  }

  /// `reset your password.`
  String get resetyourPassword {
    return Intl.message(
      'reset your password.',
      name: 'resetyourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `incorrect email or password`
  String get incorrectEmailOrPassword {
    return Intl.message(
      'incorrect email or password',
      name: 'incorrectEmailOrPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email to continue`
  String get enterYourEmailToContinue {
    return Intl.message(
      'Enter your email to continue',
      name: 'enterYourEmailToContinue',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in all the fields`
  String get pleaseFillInAllTheFields {
    return Intl.message(
      'Please fill in all the fields',
      name: 'pleaseFillInAllTheFields',
      desc: '',
      args: [],
    );
  }

  /// `Failed to sign up, please enter the correct email`
  String get failedToSignUpPleaseEnterTheCorrectEmail {
    return Intl.message(
      'Failed to sign up, please enter the correct email',
      name: 'failedToSignUpPleaseEnterTheCorrectEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please input correct email`
  String get pleaseInputCorrectEmail {
    return Intl.message(
      'Please input correct email',
      name: 'pleaseInputCorrectEmail',
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
      Locale.fromSubtags(languageCode: 'ru'),
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
