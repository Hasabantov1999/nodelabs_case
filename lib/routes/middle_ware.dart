// ignore_for_file: non_constant_identifier_names

part of '../main.dart';

class AppMiddleware {
  static Future<bool> _AuthGuard() async {

    if (await isAuthenticated()) {
      await CleanArchInjector.getInstance<UserService>().getUser();
    } else {
      CleanArchRouter().go(AppRoutes.Auth.route);
      return Future.value(false);
    }
    return Future.value(true);
  }
}
