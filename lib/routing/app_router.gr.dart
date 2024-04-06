// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:rolla_task/features/authentication/presentation/views/login_page.dart'
    as _i2;
import 'package:rolla_task/features/home/presentation/views/home_page.dart'
    as _i1;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    HomePage.name: (routeData) {
      final args =
          routeData.argsAs<HomePageArgs>(orElse: () => const HomePageArgs());
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.HomePage(key: args.key),
      );
    },
    LoginPage.name: (routeData) {
      final args = routeData.argsAs<LoginPageArgs>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.LoginPage(
          key: args.key,
          onLoginSuccess: args.onLoginSuccess,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class HomePage extends _i3.PageRouteInfo<HomePageArgs> {
  HomePage({
    _i4.Key? key,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          HomePage.name,
          args: HomePageArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomePage';

  static const _i3.PageInfo<HomePageArgs> page =
      _i3.PageInfo<HomePageArgs>(name);
}

class HomePageArgs {
  const HomePageArgs({this.key});

  final _i4.Key? key;

  @override
  String toString() {
    return 'HomePageArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.LoginPage]
class LoginPage extends _i3.PageRouteInfo<LoginPageArgs> {
  LoginPage({
    _i4.Key? key,
    required void Function() onLoginSuccess,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          LoginPage.name,
          args: LoginPageArgs(
            key: key,
            onLoginSuccess: onLoginSuccess,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginPage';

  static const _i3.PageInfo<LoginPageArgs> page =
      _i3.PageInfo<LoginPageArgs>(name);
}

class LoginPageArgs {
  const LoginPageArgs({
    this.key,
    required this.onLoginSuccess,
  });

  final _i4.Key? key;

  final void Function() onLoginSuccess;

  @override
  String toString() {
    return 'LoginPageArgs{key: $key, onLoginSuccess: $onLoginSuccess}';
  }
}
