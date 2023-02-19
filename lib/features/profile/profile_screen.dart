import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
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
              ListTile(
                onTap: _signOut,
                title: const Text("로그아웃"),
                subtitle: const Text("로그아웃하여 회원가입 페이지로 돌아갑니다."),
              ),
              const ListTile(
                title: Text("비밀번호 변경"),
                subtitle: Text("사용중인 비밀번호를 변경합니다."),
              ),
              const ListTile(
                title: Text(
                  "고객문의",
                ),
                subtitle: Text("버그나 요청사항을 문의합니다."),
              ),
              const ListTile(
                title: Text(
                  "회원탈퇴",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                subtitle: Text("이용중인 계정을 탈퇴합니다."),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
