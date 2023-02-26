import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:minigym/constants/breakpoints.dart';
import 'package:minigym/constants/sizes.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  void _onCancelPressed() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.size10,
        horizontal: Sizes.size20,
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("설정"),
          centerTitle: false,
        ),
        body: ListView(
          primary: false,
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size20,
          ),
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: Breakpoints.sm,
                ),
                child: ListTile(
                  onTap: () => showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("정말 로그아웃 하시겠습니까?"),
                      actions: [
                        TextButton(
                          onPressed: _signOut,
                          child: const Text(
                            "확인",
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: _onCancelPressed,
                          child: const Text(
                            "닫기",
                          ),
                        ),
                      ],
                    ),
                  ),
                  title: const Text("로그아웃"),
                  subtitle: const Text("로그아웃하여 로그인 페이지로 돌아갑니다."),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: Breakpoints.sm,
                ),
                child: ListTile(
                  onTap: () => showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(),
                  ),
                  title: const Text("비밀번호 변경"),
                  subtitle: const Text("사용중인 비밀번호를 변경합니다."),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: Breakpoints.sm,
                ),
                child: ListTile(
                  onTap: () => showModalBottomSheet(
                    context: context,
                    builder: (context) => Container(),
                  ),
                  title: const Text(
                    "고객문의",
                  ),
                  subtitle: const Text("버그나 요청사항을 문의합니다."),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: Breakpoints.sm,
                ),
                child: ListTile(
                  onTap: () => showAboutDialog(
                      context: context,
                      applicationName: "미니짐",
                      applicationVersion: "1.0",
                      applicationLegalese: "All rights reserved."),
                  title: const Text("라이센스 보기"),
                  subtitle: const Text("앱 관련 정보를 확인합니다."),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: Breakpoints.sm,
                ),
                child: const ListTile(
                  title: Text(
                    "회원탈퇴",
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                  subtitle: Text("이용중인 계정을 탈퇴합니다."),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
