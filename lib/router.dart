import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:minigym/features/authentication/email_screen.dart';
import 'package:minigym/features/authentication/login_form_screen.dart';
import 'package:minigym/features/authentication/login_screen.dart';
import 'package:minigym/features/authentication/signup_screen.dart';
import 'package:minigym/features/authentication/username_screen.dart';
import 'package:minigym/features/navigation/main_navigation_screen.dart';

final router = GoRouter(
  routes: [
    // 회원가입
    GoRoute(
        name: "signup_screen",
        path: "/",
        builder: (context, state) => const SignupScreen(),
        routes: [
          GoRoute(
              name: "username_screen",
              path: "username",
              pageBuilder: (context, state) {
                return CustomTransitionPage(
                  child: const UsernameScreen(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: ScaleTransition(
                        scale: animation,
                        child: child,
                      ),
                    );
                  },
                );
              },
              routes: [
                GoRoute(
                  name: "email_screen",
                  path: "email",
                  builder: (context, state) {
                    final args = state.extra as EmailScreenArgs;
                    return EmailScreen(username: args.username);
                  },
                ),
              ]),
        ]),

    // 로그인
    GoRoute(
      name: "login_screen",
      path: "/login",
      builder: (context, state) => const LoginScreen(),
      routes: [
        GoRoute(
          name: "login_form_screen",
          path: "email",
          pageBuilder: (context, state) {
            return CustomTransitionPage(
              child: const LoginFormScreen(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(
                    scale: animation,
                    child: child,
                  ),
                );
              },
            );
          },
        ),
      ],
    ),

    // 루틴
    GoRoute(
      name: "main_screen",
      path: "/main",
      builder: (context, state) => const MainNavigationScreen(),
    ),
  ],
);
