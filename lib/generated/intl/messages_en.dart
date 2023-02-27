// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alreadyHaveAnAccount": MessageLookupByLibrary.simpleMessage(
            "Do you already have an account?"),
        "createUsername": MessageLookupByLibrary.simpleMessage("사용할 이름을 입력하세요"),
        "dontHaveAnAccount": MessageLookupByLibrary.simpleMessage(
            "Don\'t you have an account yet?"),
        "email": MessageLookupByLibrary.simpleMessage("email"),
        "emailAlreadyInUse":
            MessageLookupByLibrary.simpleMessage("Email is already in use"),
        "emailIsNotValid":
            MessageLookupByLibrary.simpleMessage("Email is Not valid"),
        "enterPassword":
            MessageLookupByLibrary.simpleMessage("Enter your password"),
        "login": MessageLookupByLibrary.simpleMessage("Log In"),
        "loginSubtitle": MessageLookupByLibrary.simpleMessage(
            "Keep a record of your exercise"),
        "loginTitle":
            MessageLookupByLibrary.simpleMessage("Log in for MiniGym"),
        "loginWithApple":
            MessageLookupByLibrary.simpleMessage("Login with Apple"),
        "loginWithEmailAndPassword":
            MessageLookupByLibrary.simpleMessage("Login with Email & Password"),
        "next": MessageLookupByLibrary.simpleMessage("Next"),
        "notRegisteredEmail":
            MessageLookupByLibrary.simpleMessage("Email is not registered"),
        "password": MessageLookupByLibrary.simpleMessage("password"),
        "passwordCondition1":
            MessageLookupByLibrary.simpleMessage("8 to 20 characters"),
        "passwordCondition2": MessageLookupByLibrary.simpleMessage(
            "numbers, letters, and special characters"),
        "passwordIsWeak":
            MessageLookupByLibrary.simpleMessage("Password is too weak"),
        "passwordRequirement":
            MessageLookupByLibrary.simpleMessage("password required:"),
        "signUpSubtitle": MessageLookupByLibrary.simpleMessage(
            "Create a profile, make your own routines"),
        "signUpTitle":
            MessageLookupByLibrary.simpleMessage("Sign up for MiniGym"),
        "signUpWithApple":
            MessageLookupByLibrary.simpleMessage("Continue with Apple"),
        "signUpWithEmailAndPassword": MessageLookupByLibrary.simpleMessage(
            "Sign Up with Email & Password"),
        "signup": MessageLookupByLibrary.simpleMessage("Sign Up"),
        "username": MessageLookupByLibrary.simpleMessage("Username"),
        "whatIsYourEmail":
            MessageLookupByLibrary.simpleMessage(", What is Email to use?"),
        "wrongPassword": MessageLookupByLibrary.simpleMessage("Wrong password")
      };
}
