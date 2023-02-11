import 'package:flutter/material.dart';
import 'package:minigym/constants/gaps.dart';
import 'package:minigym/constants/sizes.dart';
import 'package:minigym/features/authentication/email_screen.dart';
import 'package:minigym/features/authentication/widgets/form_button.dart';

class UsernameScreen extends StatefulWidget {
  const UsernameScreen({super.key});

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  final TextEditingController _usernameController = TextEditingController();
  String _username = "";

  void _onNextTap() {
    if (_username.isEmpty) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const EmailScreen(),
      ),
    );
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  void initState() {
    super.initState();

    _usernameController.addListener(() {
      setState(() {
        _username = _usernameController.text;
      });
    });
  }

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: getAppBar(),
        body: getBody(),
      ),
    );
  }

  AppBar getAppBar() {
    return AppBar(
      title: const Text(
        "회원가입",
      ),
    );
  }

  Padding getBody() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.size36,
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Gaps.v40,
        const Text(
          "이름이 무엇인가요?",
          style: TextStyle(
            fontSize: Sizes.size24,
            fontWeight: FontWeight.w700,
          ),
        ),
        Gaps.v8,
        const Text(
          "나중에 이름을 변경할 수 있습니다.",
          style: TextStyle(
            fontSize: Sizes.size16,
            color: Colors.black54,
          ),
        ),
        Gaps.v16,
        TextField(
          onEditingComplete: _onNextTap,
          controller: _usernameController,
          decoration: InputDecoration(
            hintText: "이름",
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade400,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade400,
              ),
            ),
          ),
          cursorColor: Theme.of(context).primaryColor,
        ),
        Gaps.v16,
        GestureDetector(
          onTap: _onNextTap,
          child: FormButton(
            disabled: _username.isEmpty,
            text: "다음",
          ),
        ),
      ]),
    );
  }
}
