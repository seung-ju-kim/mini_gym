import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:minigym/constants/gaps.dart';
import 'package:minigym/constants/sizes.dart';
import 'package:minigym/features/authentication/widgets/form_button.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({
    super.key,
    this.email,
  });

  final email;

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();

  String _password = "";
  bool _obscureText = true;
  bool _isLoading = false;

  // 비밀번호 유효성 검사
  bool _isPasswordLength() {
    return _password.length > 8 && _password.length < 20;
  }

  bool _isPasswordReg() {
    final regExp =
        RegExp(r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]");
    return regExp.hasMatch(_password);
  }

  bool _isPasswordValid() {
    return _password.isNotEmpty && _isPasswordLength() && _isPasswordReg();
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() async {
    if (!_isPasswordValid()) return;
    setState(() {
      _isLoading = true;
    });
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: widget.email, password: _password);
    } on FirebaseAuthException catch (e) {
      if (e.code == "weak-password") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Theme.of(context).primaryColor,
            content: const Text(
              "비밀번호가 너무 취약합니다.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: Sizes.size16,
              ),
            ),
            duration: const Duration(
              seconds: 3,
            ),
          ),
        );
      } else if (e.code == "email-already-in-use") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Theme.of(context).primaryColor,
            content: const Text(
              "이미 사용중인 이메일입니다.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: Sizes.size16,
              ),
            ),
            duration: const Duration(
              seconds: 3,
            ),
          ),
        );
        Navigator.pop(context);
        setState(() {
          _isLoading = false;
        });
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Theme.of(context).primaryColor,
          content: Text(
            e.toString(),
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: Sizes.size16,
            ),
          ),
          duration: const Duration(
            seconds: 3,
          ),
        ),
      );
      setState(() {
        _isLoading = false;
      });
    }

    await FirebaseAuth.instance.setPersistence(Persistence.NONE);
  }

  void _onClearTap() {
    _passwordController.clear();
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    super.initState();

    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gaps.v40,
          const Text(
            "비밀번호를 입력하세요",
            style: TextStyle(
              fontSize: Sizes.size24,
              fontWeight: FontWeight.w700,
            ),
          ),
          Gaps.v16,
          TextField(
            obscureText: _obscureText,
            autocorrect: false,
            controller: _passwordController,
            onEditingComplete: _onSubmit,
            decoration: InputDecoration(
              suffix: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: _onClearTap,
                    child: FaIcon(
                      FontAwesomeIcons.solidCircleXmark,
                      color: Colors.grey.shade500,
                      size: Sizes.size20,
                    ),
                  ),
                  Gaps.h14,
                  GestureDetector(
                    onTap: _toggleObscureText,
                    child: FaIcon(
                      _obscureText
                          ? FontAwesomeIcons.eye
                          : FontAwesomeIcons.eyeSlash,
                      color: Colors.grey.shade500,
                      size: Sizes.size20,
                    ),
                  )
                ],
              ),
              hintText: "비밀번호",
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
          Gaps.v10,
          const Text(
            "비밀번호 필수 조건:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Gaps.v10,
          Row(
            children: [
              FaIcon(
                FontAwesomeIcons.circleCheck,
                size: Sizes.size20,
                color:
                    _isPasswordLength() ? Colors.green : Colors.grey.shade400,
              ),
              Gaps.h5,
              const Text("8자 이상 20자 이하"),
            ],
          ),
          Gaps.v10,
          Row(
            children: [
              FaIcon(
                FontAwesomeIcons.circleCheck,
                size: Sizes.size20,
                color: _isPasswordReg() ? Colors.green : Colors.grey.shade400,
              ),
              Gaps.h5,
              const Text("숫자, 문자, 특수문자의 조합"),
            ],
          ),
          Gaps.v28,
          GestureDetector(
            onTap: _onSubmit,
            child: FormButton(
              disabled: !_isPasswordValid() || _isLoading,
              text: "다음",
            ),
          ),
        ],
      ),
    );
  }
}
