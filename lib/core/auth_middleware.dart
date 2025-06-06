import 'package:clean_arch/clean_arch_cache_manager/clean_arch_cache_manager.dart';
import 'package:sinflix_app/core/storage_keys.dart';

Future<bool> isAuthenticated() async {
  if (await CleanArchStorage.instance.get(StorageKeys.token.name) == null) {
    return Future.value(false);
  }
  return Future.value(true);
}
