// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:rolla_task/features/authentication/presentation/views/login_page.dart'
    as _i2;
import 'package:rolla_task/features/home/presentation/views/home_page.dart'
    as _i1;
import 'package:rolla_task/features/user_details/presentation/views/user_details_page.dart'
    as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    HomePage.name: (routeData) {
      final args =
          routeData.argsAs<HomePageArgs>(orElse: () => const HomePageArgs());
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.HomePage(key: args.key),
      );
    },
    LoginPage.name: (routeData) {
      final args = routeData.argsAs<LoginPageArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.LoginPage(
          key: args.key,
          onLoginSuccess: args.onLoginSuccess,
        ),
      );
    },
    UserDetailsPage.name: (routeData) {
      final args = routeData.argsAs<UserDetailsPageArgs>(
          orElse: () => const UserDetailsPageArgs());
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.UserDetailsPage(
          key: args.key,
          email: args.email,
          firstName: args.firstName,
          lastName: args.lastName,
          avatarUrl: args.avatarUrl,
          age: args.age,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class HomePage extends _i4.PageRouteInfo<HomePageArgs> {
  HomePage({
    _i5.Key? key,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          HomePage.name,
          args: HomePageArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'HomePage';

  static const _i4.PageInfo<HomePageArgs> page =
      _i4.PageInfo<HomePageArgs>(name);
}

class HomePageArgs {
  const HomePageArgs({this.key});

  final _i5.Key? key;

  @override
  String toString() {
    return 'HomePageArgs{key: $key}';
  }
}

/// generated route for
/// [_i2.LoginPage]
class LoginPage extends _i4.PageRouteInfo<LoginPageArgs> {
  LoginPage({
    _i5.Key? key,
    required void Function() onLoginSuccess,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          LoginPage.name,
          args: LoginPageArgs(
            key: key,
            onLoginSuccess: onLoginSuccess,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginPage';

  static const _i4.PageInfo<LoginPageArgs> page =
      _i4.PageInfo<LoginPageArgs>(name);
}

class LoginPageArgs {
  const LoginPageArgs({
    this.key,
    required this.onLoginSuccess,
  });

  final _i5.Key? key;

  final void Function() onLoginSuccess;

  @override
  String toString() {
    return 'LoginPageArgs{key: $key, onLoginSuccess: $onLoginSuccess}';
  }
}

/// generated route for
/// [_i3.UserDetailsPage]
class UserDetailsPage extends _i4.PageRouteInfo<UserDetailsPageArgs> {
  UserDetailsPage({
    _i5.Key? key,
    String? email,
    String? firstName,
    String? lastName,
    String? avatarUrl,
    int? age,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          UserDetailsPage.name,
          args: UserDetailsPageArgs(
            key: key,
            email: email,
            firstName: firstName,
            lastName: lastName,
            avatarUrl: avatarUrl,
            age: age,
          ),
          initialChildren: children,
        );

  static const String name = 'UserDetailsPage';

  static const _i4.PageInfo<UserDetailsPageArgs> page =
      _i4.PageInfo<UserDetailsPageArgs>(name);
}

class UserDetailsPageArgs {
  const UserDetailsPageArgs({
    this.key,
    this.email,
    this.firstName,
    this.lastName,
    this.avatarUrl,
    this.age,
  });

  final _i5.Key? key;

  final String? email;

  final String? firstName;

  final String? lastName;

  final String? avatarUrl;

  final int? age;

  @override
  String toString() {
    return 'UserDetailsPageArgs{key: $key, email: $email, firstName: $firstName, lastName: $lastName, avatarUrl: $avatarUrl, age: $age}';
  }
}
