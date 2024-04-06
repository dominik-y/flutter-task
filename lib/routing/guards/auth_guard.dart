import 'package:auto_route/auto_route.dart';
import 'package:rolla_task/features/authentication/providers/user_provider.dart';
import 'package:rolla_task/routing/app_router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  final UserNotifier sessionNotifier;

  AuthGuard({
    required this.sessionNotifier,
  });

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    print(sessionNotifier.isAuthenticated());
    if (sessionNotifier.isAuthenticated()) {
      resolver.next(true);
    } else {
      resolver.redirect(
        LoginPage(
          onLoginSuccess: () {
            resolver.next(true);
          },
        ),
      );
    }
  }
}
