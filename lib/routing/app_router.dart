import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:rolla_task/domain/repositories/auth_repository.dart';
import 'package:rolla_task/features/authentication/providers/user_provider.dart';
import 'package:rolla_task/routing/guards/auth_guard.dart';
import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Route,Page')
class AppRouter extends $AppRouter {
  final AuthRepository authRepository;

  AppRouter({
    required this.authRepository,
  });

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  late final List<AutoRoute> routes = [
    AutoRoute(page: LoginPage.page),
    AutoRoute(page: UserDetailsPage.page),
    AutoRoute(
      page: HomePage.page,
      initial: true,
      guards: [
        AuthGuard(authRepository: authRepository),
      ],
    ),
  ];
}
