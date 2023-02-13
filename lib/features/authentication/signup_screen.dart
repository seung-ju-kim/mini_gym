import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minigym/constants/gaps.dart';
import 'package:minigym/constants/sizes.dart';
import 'package:minigym/features/authentication/email_screen.dart';
import 'package:minigym/features/authentication/login_screen.dart';
import 'package:minigym/features/authentication/widgets/auth_button.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  void _onLoginTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  void _onEmailTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const EmailScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(context),
      bottomNavigationBar: getBottomNavigationBar(context),
    );
  }

  Padding getBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
      child: Column(children: [
        Gaps.v80,
        const Text(
          "미니짐에 오신 것을 환영합니다.",
          style: TextStyle(
            fontSize: Sizes.size24,
            fontWeight: FontWeight.w700,
          ),
        ),
        Gaps.v20,
        const Text(
          "프로필을 생성하고 오늘부터 운동을 기록해보세요.",
          style: TextStyle(
            fontSize: Sizes.size16,
            color: Colors.black45,
          ),
          textAlign: TextAlign.center,
        ),
        Gaps.v40,
        AuthButton(
          icon: const FaIcon(FontAwesomeIcons.user),
          text: "이메일, 비밀번호로 가입하기",
          action: () => _onEmailTap(context),
        ),
        Gaps.v16,
        // AuthButton(
        //   icon: const FaIcon(FontAwesomeIcons.apple),
        //   text: "Apple로 시작하기",
        //   action: () => _onEmailTap(context),
        // ),
        Gaps.v16,
      ]),
    );
  }

  BottomAppBar getBottomNavigationBar(BuildContext context) {
    return BottomAppBar(
      color: Colors.grey.shade50,
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "이미 계정이 있으신가요?",
              style: TextStyle(
                fontSize: Sizes.size16,
              ),
            ),
            Gaps.h5,
            GestureDetector(
              onTap: () => _onLoginTap(context),
              child: Text(
                "로그인",
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                  fontSize: Sizes.size16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
