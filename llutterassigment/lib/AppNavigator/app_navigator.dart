import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:llutterassigment/Screen/UniversityListScreen/Controller/CountryItemController.dart';
import 'package:provider/provider.dart';
import '../Screen/UniversityListScreen/View/UniversitiesScreen.dart';

typedef AN = AppNavigator;

final navigatorKey = GlobalKey<NavigatorState>();

class AppNavigator {
  static final router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: navigatorKey,
    initialLocation: '/home',
    routes: [
      GoRoute(
        path: '/home',
        name: '/home',
        builder: (context, state) {
          return ChangeNotifierProvider(
            create: (_) => UniversityScreenController(),
            builder: (context, child) {
              return const UniversitiesListScreen();
            },
          );
        },
      ),
    ],
  );

  /// Replace All Routes
  static replaceAll(
    BuildContext context,
    String route, {
    Map<String, String> parameters = const <String, String>{},
  }) =>
      context.goNamed(
        route,
        queryParameters: parameters,
      );

  /// Replace Last Route without Push Animation
  static replace(
    BuildContext context,
    String route, {
    Map<String, String> parameters = const <String, String>{},
  }) =>
      context.replaceNamed(
        route,
        queryParameters: parameters,
      );

  /// Replace Last Route
  static pushReplace(
    BuildContext context,
    String route, {
    Map<String, String> parameters = const <String, String>{},
  }) =>
      context.pushReplacementNamed(
        route,
        queryParameters: parameters,
      );

  /// Push New Route
  static Future<void> push(
    BuildContext context,
    String route, {
    Map<String, String> parameters = const <String, String>{},
  }) async =>
      await context.pushNamed(
        route,
        queryParameters: parameters,
      );

  /// Pop Route
  static pop(
    BuildContext context,
    Map<String, String>? parameters,
  ) =>
      context.pop(
        parameters,
      );
}
