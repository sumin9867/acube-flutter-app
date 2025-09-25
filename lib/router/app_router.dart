import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';

@Singleton()
class AppRouter {
  final GlobalKey<NavigatorState> _navigationKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  void go(String route, {Object? extra}) {
    return GoRouter.of(_navigationKey.currentContext!).go(route, extra: extra);
  }

  Future push(String route, {Object? extra}) {
    return GoRouter.of(_navigationKey.currentContext!).push(route, extra: extra);
  }

  Future replace(String route, {Object? extra}) {
    return GoRouter.of(_navigationKey.currentContext!).replace(route, extra: extra);
  }

  Future pushReplacement(String route, {Object? extra}) {
    return GoRouter.of(_navigationKey.currentContext!).pushReplacement(route, extra: extra);
  }

  void pop<T extends Object?>([T? result]) {
    GoRouter.of(_navigationKey.currentContext!).pop(result);
  }

  bool canPop() {
    return GoRouter.of(_navigationKey.currentContext!).canPop();
  }

  String? get currentLocation {
    return GoRouter.of(_navigationKey.currentContext!).namedLocation('');
  }

  bool isCurrentRoute(String route) {
    return currentLocation?.startsWith(route) ?? false;
  }
}
