// ignore_for_file: constant_identifier_names

part of '../main.dart';

enum AppRoutes {
  Dashboard(
    route: CleanArchRoute(
      mobile: DashboardView(),
      path: '/',
      routeGuard: AppMiddleware._AuthGuard,
    ),
  ),
  Auth(
    route: CleanArchRoute(
      mobile: AuthView(),
      path: '/auth',
    ),
  ),
  Splash(
    route: CleanArchRoute(
      mobile: SplashView(),
      path: '/splash',
    ),
  );

  final CleanArchRoute route;
  const AppRoutes({required this.route});
}
