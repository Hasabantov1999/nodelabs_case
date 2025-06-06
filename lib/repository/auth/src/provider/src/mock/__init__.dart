// ignore_for_file: use_string_in_part_of_directives

part of auth_repository;

class AuthMockProvider implements AuthRepository {
  @override
  Future<LoginResponseSchema> login({required LoginRequestSchema request}) {
    throw UnimplementedError();
  }

  @override
  Future<UserProfileResponseSchema> profile() {
    throw UnimplementedError();
  }

  @override
  Future<RegisterResponseSchema> register({required RegisterRequestSchema request}) {
    throw UnimplementedError();
  }
  
}
