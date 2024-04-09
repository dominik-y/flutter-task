import 'package:auto_route/auto_route.dart';
import 'package:rolla_task/domain/repositories/auth_repository.dart';
import 'package:rolla_task/features/authentication/providers/user_provider.dart';
import 'package:rolla_task/routing/app_router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  final AuthRepository authRepository;

  AuthGuard({
    required this.authRepository,
  });

  @override
  Future<void> onNavigation(
      NavigationResolver resolver, StackRouter router) async {
    final token = await authRepository.getCurrent();

    if (token != null) {
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

  // @override
  // Future<void> reevaluateListenable(
  //     NavigationResolver resolver, StackRouter router) async {
  //   final token = await authRepository.clearCurrent();
  //
  //   if (token == null) {
  //     resolver.redirect(
  //       LoginPage(
  //         onLoginSuccess: () {},
  //       ),
  //     );
  //   }
  // }
}
