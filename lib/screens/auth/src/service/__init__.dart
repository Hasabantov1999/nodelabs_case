// ignore_for_file: use_string_in_part_of_directives

part of auth;

class AuthService extends CleanArchBaseService {
  @override
  void init() {}
  @override
  void dispose() {}

  Future<void> login(LoginRequestSchema request) async {
   try {
      final result = await CleanArchInjector.getInstance<AuthRepository>().login(
      request: request,
    );

    await CleanArchStorage.instance.set(
      StorageKeys.token.name,
      result.token!,
    );


    await CleanArchInjector.getInstance<UserService>().getUser();

    CleanArchRouter().go(AppRoutes.Dashboard.route);
   } catch (e) {
     print(e);
   }
  }
}
