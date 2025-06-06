// ignore_for_file: use_string_in_part_of_directives

part of auth_repository;

abstract class AuthRepository implements CleanArchBaseRepository {
  Future<LoginResponseSchema> login({
    required LoginRequestSchema request,
  });
  Future<RegisterResponseSchema> register({
    required RegisterRequestSchema request,
  });
  Future<UserProfileResponseSchema> profile();
}
