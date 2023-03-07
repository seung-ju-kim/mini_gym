// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ko locale. All the
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
  String get localeName => 'ko';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "alreadyHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("이미 계정이 있으신가요?"),
        "createUsername": MessageLookupByLibrary.simpleMessage("사용할 이름을 입력하세요"),
        "dontHaveAnAccount":
            MessageLookupByLibrary.simpleMessage("아직 계정이 없으신가요?"),
        "email": MessageLookupByLibrary.simpleMessage("이메일"),
        "emailAlreadyInUse":
            MessageLookupByLibrary.simpleMessage("이미 사용중인 이메일입니다."),
        "emailIsNotValid":
            MessageLookupByLibrary.simpleMessage("이메일 형식이 유효하지 않습니다."),
        "enterPassword": MessageLookupByLibrary.simpleMessage("비밀번호를 입력하세요"),
        "login": MessageLookupByLibrary.simpleMessage("로그인"),
        "loginSubtitle": MessageLookupByLibrary.simpleMessage(
            "오늘은 어떤 운동을 하셨나요? 당신의 운동을 기록하세요"),
        "loginTitle": MessageLookupByLibrary.simpleMessage("MinGym에 로그인하세요"),
        "loginWithApple": MessageLookupByLibrary.simpleMessage("Apple 로그인"),
        "loginWithEmailAndPassword":
            MessageLookupByLibrary.simpleMessage("이메일 & 비밀번호 로그인"),
        "next": MessageLookupByLibrary.simpleMessage("다음"),
        "notRegisteredEmail":
            MessageLookupByLibrary.simpleMessage("등록된 이메일이 아닙니다"),
        "password": MessageLookupByLibrary.simpleMessage("비밀번호"),
        "passwordCondition1":
            MessageLookupByLibrary.simpleMessage("8자 이상 20자 이하"),
        "passwordCondition2":
            MessageLookupByLibrary.simpleMessage("숫자, 문자, 특수문자의 조합"),
        "passwordIsWeak":
            MessageLookupByLibrary.simpleMessage("비밀번호가 너무 취약합니다."),
        "passwordRequirement":
            MessageLookupByLibrary.simpleMessage("비밀번호 필수 조건:"),
        "signUpSubtitle":
            MessageLookupByLibrary.simpleMessage("프로필을 생성하여 당신의 루틴을 공유하세요"),
        "signUpTitle": MessageLookupByLibrary.simpleMessage("MiniGym에 가입하세요"),
        "signUpWithApple": MessageLookupByLibrary.simpleMessage("Apple로 계속하기"),
        "signUpWithEmailAndPassword":
            MessageLookupByLibrary.simpleMessage("이메일 & 비밀번호 회원가입"),
        "signup": MessageLookupByLibrary.simpleMessage("회원가입"),
        "username": MessageLookupByLibrary.simpleMessage("이름"),
        "whatIsYourEmail":
            MessageLookupByLibrary.simpleMessage("님이 사용할 이메일은 무엇인가요?"),
        "wrongPassword": MessageLookupByLibrary.simpleMessage("잘못된 비밀번호 입니다")
      };
}
