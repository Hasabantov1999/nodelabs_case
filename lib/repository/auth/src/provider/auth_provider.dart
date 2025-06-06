// ignore_for_file: use_string_in_part_of_directives

part of auth_repository;

class AuthProvider implements AuthRepository {
  final AuthRepository provider;
  AuthProvider({
    required this.provider,
  });

  @override
  Future<LoginResponseSchema> login({
    required LoginRequestSchema request,
  }) {
    return provider.login(request: request);
  }

  @override
  Future<UserProfileResponseSchema> profile() {
    return provider.profile();
  }

  @override
  Future<RegisterResponseSchema> register({
    required RegisterRequestSchema request,
  }) {
    return provider.register(request: request);
  }
}
