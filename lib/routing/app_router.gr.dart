// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/cupertino.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:rolla_task/features/authentication/presentation/views/login_page.dart'
    as _i3;
import 'package:rolla_task/features/home/presentation/views/home_page.dart'
    as _i1;
import 'package:rolla_task/features/log/presentation/views/log_page.dart'
    as _i2;
import 'package:rolla_task/features/products/presentation/views/products_page.dart'
    as _i4;
import 'package:rolla_task/features/user_details/presentation/views/user_details_page.dart'
    as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    HomePage.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    LogPage.name: (routeData) {
      final args =
          routeData.argsAs<LogPageArgs>(orElse: () => const LogPageArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.LogPage(
          key: args.key,
          createdAt: args.createdAt,
          actorUsername: args.actorUsername,
          payloadDescription: args.payloadDescription,
          eventType: args.eventType,
        ),
      );
    },
    LoginPage.name: (routeData) {
      final args = routeData.argsAs<LoginPageArgs>();
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.LoginPage(
          key: args.key,
          onLoginSuccess: args.onLoginSuccess,
        ),
      );
    },
    ProductsPage.name: (routeData) {
      final args = routeData.argsAs<ProductsPageArgs>(
          orElse: () => const ProductsPageArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i4.ProductsPage(
          key: args.key,
          userAvatar: args.userAvatar,
        ),
      );
    },
    UserDetailsPage.name: (routeData) {
      final args = routeData.argsAs<UserDetailsPageArgs>(
          orElse: () => const UserDetailsPageArgs());
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.UserDetailsPage(
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
class HomePage extends _i6.PageRouteInfo<void> {
  const HomePage({List<_i6.PageRouteInfo>? children})
      : super(
          HomePage.name,
          initialChildren: children,
        );

  static const String name = 'HomePage';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.LogPage]
class LogPage extends _i6.PageRouteInfo<LogPageArgs> {
  LogPage({
    _i7.Key? key,
    int? createdAt,
    String? actorUsername,
    String? payloadDescription,
    String? eventType,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          LogPage.name,
          args: LogPageArgs(
            key: key,
            createdAt: createdAt,
            actorUsername: actorUsername,
            payloadDescription: payloadDescription,
            eventType: eventType,
          ),
          initialChildren: children,
        );

  static const String name = 'LogPage';

  static const _i6.PageInfo<LogPageArgs> page = _i6.PageInfo<LogPageArgs>(name);
}

class LogPageArgs {
  const LogPageArgs({
    this.key,
    this.createdAt,
    this.actorUsername,
    this.payloadDescription,
    this.eventType,
  });

  final _i7.Key? key;

  final int? createdAt;

  final String? actorUsername;

  final String? payloadDescription;

  final String? eventType;

  @override
  String toString() {
    return 'LogPageArgs{key: $key, createdAt: $createdAt, actorUsername: $actorUsername, payloadDescription: $payloadDescription, eventType: $eventType}';
  }
}

/// generated route for
/// [_i3.LoginPage]
class LoginPage extends _i6.PageRouteInfo<LoginPageArgs> {
  LoginPage({
    _i8.Key? key,
    required void Function() onLoginSuccess,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          LoginPage.name,
          args: LoginPageArgs(
            key: key,
            onLoginSuccess: onLoginSuccess,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginPage';

  static const _i6.PageInfo<LoginPageArgs> page =
      _i6.PageInfo<LoginPageArgs>(name);
}

class LoginPageArgs {
  const LoginPageArgs({
    this.key,
    required this.onLoginSuccess,
  });

  final _i8.Key? key;

  final void Function() onLoginSuccess;

  @override
  String toString() {
    return 'LoginPageArgs{key: $key, onLoginSuccess: $onLoginSuccess}';
  }
}

/// generated route for
/// [_i4.ProductsPage]
class ProductsPage extends _i6.PageRouteInfo<ProductsPageArgs> {
  ProductsPage({
    _i8.Key? key,
    String? userAvatar,
    List<_i6.PageRouteInfo>? children,
  }) : super(
          ProductsPage.name,
          args: ProductsPageArgs(
            key: key,
            userAvatar: userAvatar,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductsPage';

  static const _i6.PageInfo<ProductsPageArgs> page =
      _i6.PageInfo<ProductsPageArgs>(name);
}

class ProductsPageArgs {
  const ProductsPageArgs({
    this.key,
    this.userAvatar,
  });

  final _i8.Key? key;

  final String? userAvatar;

  @override
  String toString() {
    return 'ProductsPageArgs{key: $key, userAvatar: $userAvatar}';
  }
}

/// generated route for
/// [_i5.UserDetailsPage]
class UserDetailsPage extends _i6.PageRouteInfo<UserDetailsPageArgs> {
  UserDetailsPage({
    _i8.Key? key,
    String? email,
    String? firstName,
    String? lastName,
    String? avatarUrl,
    int? age,
    List<_i6.PageRouteInfo>? children,
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

  static const _i6.PageInfo<UserDetailsPageArgs> page =
      _i6.PageInfo<UserDetailsPageArgs>(name);
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

  final _i8.Key? key;

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
