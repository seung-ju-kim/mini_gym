import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:minigym/constants/sizes.dart';
import 'package:minigym/firebase_options.dart';
import 'package:minigym/generated/l10n.dart';
import 'package:minigym/router.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // Flutter engine과 framework를 묶는 접착제를 앱을 실행하기 전에 초기화
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase 초기화
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // 화면 회전 세로 고정
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );

  // 기기 로컬 저장소 초기화
  final preferences = await SharedPreferences.getInstance();

  runApp(
    const ProviderScope(
      child: MiniGymApp(),
    ),
  );
}

class MiniGymApp extends ConsumerWidget {
  const MiniGymApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.watch(routerProvider),
      debugShowCheckedModeBanner: false,
      title: 'Mini Gym',
      localizationsDelegates: const [
        S.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("ko"),
        Locale("en"),
      ],
      themeMode: ThemeMode.system,
      theme: ThemeData(
        brightness: Brightness.light,
        textTheme: GoogleFonts.doHyeonTextTheme(
          const TextTheme(
            displayLarge: TextStyle(
                fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5),
            displayMedium: TextStyle(
                fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5),
            displaySmall: TextStyle(fontSize: 48, fontWeight: FontWeight.w400),
            headlineMedium: TextStyle(
                fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
            headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            titleLarge: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
            titleMedium: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
            titleSmall: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
            bodyLarge: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
            bodyMedium: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
            labelLarge: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
            bodySmall: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
            labelSmall: TextStyle(
                fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
          ),
        ),
        scaffoldBackgroundColor: Colors.grey.shade50,
        primaryColor: const Color(0xFFF59F00),
        appBarTheme: AppBarTheme(
          surfaceTintColor: Colors.grey.shade50,
          backgroundColor: Colors.grey.shade50,
          foregroundColor: Colors.black,
          elevation: 0,
          titleTextStyle: const TextStyle(
            color: Colors.black,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.grey.shade50,
        ),
      ),
      darkTheme: ThemeData(
        textTheme: GoogleFonts.doHyeonTextTheme(
          const TextTheme(
            displayLarge: TextStyle(
                fontSize: 96, fontWeight: FontWeight.w300, letterSpacing: -1.5),
            displayMedium: TextStyle(
                fontSize: 60, fontWeight: FontWeight.w300, letterSpacing: -0.5),
            displaySmall: TextStyle(fontSize: 48, fontWeight: FontWeight.w400),
            headlineMedium: TextStyle(
                fontSize: 34, fontWeight: FontWeight.w400, letterSpacing: 0.25),
            headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
            titleLarge: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.15),
            titleMedium: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.15),
            titleSmall: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.1),
            bodyLarge: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
            bodyMedium: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
            labelLarge: TextStyle(
                fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
            bodySmall: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
            labelSmall: TextStyle(
                fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
          ),
        ),
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.grey.shade800,
        primaryColor: const Color(0xFFF59F00),
        appBarTheme: AppBarTheme(
          surfaceTintColor: Colors.grey.shade800,
          backgroundColor: Colors.grey.shade800,
          foregroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontSize: Sizes.size16 + Sizes.size2,
            fontWeight: FontWeight.w600,
          ),
        ),
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.grey.shade800,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.grey.shade800,
        ),
      ),
    );
  }
}
