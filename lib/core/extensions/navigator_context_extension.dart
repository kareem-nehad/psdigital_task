import 'package:flutter/material.dart';

extension NavigatorContextExtension on BuildContext {
  Future<T?> pushNamed<T extends Object?>(
      String routeName, {
        Object? arguments,
      }) {
    return Navigator.of(this).pushNamed<T>(routeName, arguments: arguments);
  }

  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
      BuildContext context,
      String routeName, {
        TO? result,
        Object? arguments,
      }) {
    return Navigator.of(
      context,
    ).pushReplacementNamed<T, TO>(routeName, arguments: arguments, result: result);
  }

  Future<T?> pushNamedAndRemoveUntil<T extends Object?>(
      BuildContext context,
      String newRouteName,
      RoutePredicate predicate, {
        Object? arguments,
      }) {
    return Navigator.of(
      context,
    ).pushNamedAndRemoveUntil<T>(newRouteName, predicate, arguments: arguments);
  }

  Future<T?> push<T extends Object?>(BuildContext context, Route<T> route) {
    return Navigator.of(context).push(route);
  }

  Future<T?> pushReplacement<T extends Object?, TO extends Object?>(
      BuildContext context,
      Route<T> newRoute, {
        TO? result,
      }) {
    return Navigator.of(context).pushReplacement<T, TO>(newRoute, result: result);
  }

  Future<T?> pushAndRemoveUntil<T extends Object?>(
      BuildContext context,
      Route<T> newRoute,
      RoutePredicate predicate,
      ) {
    return Navigator.of(context).pushAndRemoveUntil<T>(newRoute, predicate);
  }

  bool canPop(BuildContext context) {
    final NavigatorState? navigator = Navigator.maybeOf(context);
    return navigator != null && navigator.canPop();
  }

  Future<bool> maybePop<T extends Object?>(BuildContext context, [T? result]) {
    return Navigator.of(context).maybePop<T>(result);
  }

  void pop<T extends Object?>([T? result]) {
    Navigator.of(this).pop<T>(result);
  }

  void popUntil(BuildContext context, RoutePredicate predicate) {
    Navigator.of(context).popUntil(predicate);
  }
}