// ignore_for_file: use_string_in_part_of_directives

part of auth_repository;

class AuthHttpProvider implements AuthRepository {
  @override
  Future<LoginResponseSchema> login({
    required LoginRequestSchema request,
  }) async {
    final res = await CleanArchNetworkManager.instance.send(
      path: "/user/login",
      type: RequestType.POST,
      body: request.toJson(),
    );
    return res.throwOrExceptionModel<LoginResponseSchema>(
      model: LoginResponseSchema(),
    );
  }

  @override
  Future<UserProfileResponseSchema> profile() async {
    final res = await CleanArchNetworkManager.instance.send(
      path: "/user/profile",
      type: RequestType.GET,
    );
    return res.throwOrExceptionModel<UserProfileResponseSchema>(
      model: UserProfileResponseSchema(),
    );
  }

  @override
  Future<RegisterResponseSchema> register({
    required RegisterRequestSchema request,
  }) async {
    final res = await CleanArchNetworkManager.instance.send(
      path: "/user/register",
      type: RequestType.POST,
      body: request.toJson(),
    );
    return res.throwOrExceptionModel<RegisterResponseSchema>(
      model: RegisterResponseSchema(),
    );
  }
}
