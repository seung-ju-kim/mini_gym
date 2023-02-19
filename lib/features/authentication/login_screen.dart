import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minigym/constants/gaps.dart';
import 'package:minigym/constants/sizes.dart';
import 'package:minigym/features/authentication/login_form_screen.dart';
import 'package:minigym/features/authentication/widgets/auth_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void _onSignupTap(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _onLoginTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LoginFormScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(),
        leading: Container(),
      ),
      body: getBody(context),
      bottomNavigationBar: getBottomNavigationBar(context),
    );
  }

  Padding getBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
      child: Column(children: [
        Gaps.v80,
        RichText(
          text: TextSpan(
            text: "미니짐",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontSize: Sizes.size24,
              fontWeight: FontWeight.w700,
            ),
            children: const <TextSpan>[
              TextSpan(
                  text: " 로그인",
                  style: TextStyle(
                    color: Colors.black,
                  )),
            ],
          ),
        ),
        Gaps.v20,
        const Text(
          "오늘의 운동을 기록 하세요",
          style: TextStyle(
            fontSize: Sizes.size16,
            color: Colors.black45,
          ),
          textAlign: TextAlign.center,
        ),
        Gaps.v40,
        AuthButton(
          icon: const FaIcon(FontAwesomeIcons.user),
          text: "이메일, 비밀번호로 로그인",
          action: () => _onLoginTap(context),
        ),
        Gaps.v16,
        // AuthButton(
        //   icon: const FaIcon(FontAwesomeIcons.apple),
        //   text: "Apple로 로그인",
        //   action: () => _onSignupTap(context),
        // ),
        Gaps.v16,
      ]),
    );
  }

  BottomAppBar getBottomNavigationBar(BuildContext context) {
    return BottomAppBar(
      color: Colors.grey.shade50,
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "아직 계정이 없으신가요?",
              style: TextStyle(
                fontSize: Sizes.size16,
              ),
            ),
            Gaps.h5,
            GestureDetector(
              onTap: () => _onSignupTap(context),
              child: Text(
                "회원가입",
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
