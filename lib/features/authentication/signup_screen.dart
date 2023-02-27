import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:minigym/constants/gaps.dart';
import 'package:minigym/constants/sizes.dart';
import 'package:minigym/features/authentication/widgets/auth_button.dart';
import 'package:minigym/generated/l10n.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  void _onLoginTap(BuildContext context) async {
    context.pushNamed("login_screen");
  }

  void _onEmailPasswordTap(BuildContext context) {
    context.pushNamed("username_screen");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size40,
          ),
          child: Column(
            children: [
              Gaps.v80,
              Text(
                S.of(context).signUpTitle,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Gaps.v20,
              Opacity(
                opacity: 0.7,
                child: Text(
                  S.of(context).signUpSubtitle,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Gaps.v40,
              AuthButton(
                icon: const FaIcon(FontAwesomeIcons.user),
                text: S.of(context).signUpWithEmailAndPassword,
                action: () => _onEmailPasswordTap(context),
              ),
              // Gaps.v16,
              // AuthButton(
              //   icon: const FaIcon(FontAwesomeIcons.apple),
              //   text: S.of(context).signUpWithApple,
              //   action: () => _onEmailPasswordTap(context),
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size20,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                S.of(context).alreadyHaveAnAccount,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Gaps.h5,
              GestureDetector(
                onTap: () => _onLoginTap(context),
                child: Text(
                  S.of(context).login,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
