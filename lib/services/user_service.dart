import 'package:clean_arch/clean_arch.dart';
import 'package:sinflix_app/core/auth_middleware.dart';
import 'package:sinflix_app/core/storage_keys.dart';
import 'package:sinflix_app/main.dart';
import 'package:sinflix_app/repository/auth/auth_repository.dart';
import 'package:sinflix_app/schemas/http/user_profile_response_schema/user_profile_response_schema.dart';

class UserService {
  late UserProfileResponseSchema _user;
  UserProfileResponseSchema get user => _user;
  Future<void> getUser() async {
    if (await isAuthenticated()) {
      final token = await CleanArchStorage.instance.get(StorageKeys.token.name);
      CleanArchNetworkManager.instance.setHeaders(
        headers: {
          'Content-Type': 'application/json',
          "Authorization": "Bearer $token"
        },
      );
      _user = await CleanArchInjector.getInstance<AuthRepository>().profile();
    } else {
      CleanArchRouter().go(
        AppRoutes.Auth.route,
      );
    }
  }
}
