// ignore_for_file: use_string_in_part_of_directives

part of sign_up;

class SignUpService extends CleanArchBaseService {
  @override
  void init() {}
  @override
  void dispose() {}
  Future<void> register(RegisterRequestSchema request) async {
    final result = await CleanArchInjector.getInstance<AuthRepository>().register(
      request: request,
    );

    await CleanArchStorage.instance.set(
      StorageKeys.token.name,
      result.token!,
    );

    await CleanArchInjector.getInstance<UserService>().getUser();

    CleanArchRouter().go(AppRoutes.Dashboard.route);
  }
}
