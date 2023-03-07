import 'package:go_router/go_router.dart';
import 'package:minigym/common/widgets/navigation/main_navigation_screen.dart';
import 'package:minigym/features/authentication/login_screen.dart';
import 'package:minigym/features/authentication/repos/authentication_rep.dart';
import 'package:minigym/features/authentication/signup_screen.dart';
import 'package:minigym/features/community/views/community_screen.dart';
import 'package:riverpod/riverpod.dart';

final routerProvider = Provider(
  (ref) {
    ref.read(authRepo);
    return GoRouter(
      redirect: (context, state) {
        final isLoggedIn = ref.read(authRepo).isLoggedIn;
        if (!isLoggedIn) {
          if (state.subloc != SignupScreen.routeURL &&
              state.subloc != LoginScreen.routeURL) {
            return SignupScreen.routeURL;
          }
        }
        return null;
      },
      initialLocation: CommunityScreen.routeURL,
      routes: [
        GoRoute(
          name: SignupScreen.routeName,
          path: SignupScreen.routeURL,
          builder: (context, state) => const SignupScreen(),
        ),
        GoRoute(
          name: LoginScreen.routeName,
          path: LoginScreen.routeURL,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: "/:tab(community|routine|timer|calendar|profile)",
          name: MainNavigationScreen.routeName,
          builder: (context, state) =>
              MainNavigationScreen(tab: state.params["tab"]!),
        ),
      ],
    );
  },
);
