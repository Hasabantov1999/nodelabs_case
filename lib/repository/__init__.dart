import 'package:clean_arch/clean_arch_injector/clean_arch_injector.dart';
import 'package:sinflix_app/config.dart';
import 'package:sinflix_app/repository/auth/auth_repository.dart';
import 'package:sinflix_app/repository/transactions/transactions_repository.dart';
import 'package:sinflix_app/services/network_manager.dart';
import 'package:sinflix_app/services/user_service.dart';

class RepositoryInjection {
  static final RepositoryInjection instance = RepositoryInjection._internal();

  factory RepositoryInjection() => instance;

  RepositoryInjection._internal();

  void init() {
    CleanArchInjector.init<AuthRepository>(
      AuthProvider(
        provider: CleanArchInjector.getProvider(
          http: AuthHttpProvider(),
          mock: AuthMockProvider(),
        ),
      ),
    );
    CleanArchInjector.init<TransactionsRepository>(
      TransactionsProvider(
        provider: CleanArchInjector.getProvider(
          http: TransactionsHttpProvider(),
          mock: TransactionsMockProvider(),
        ),
      ),
    );
    CleanArchInjector.init<NetworkManager>(NetworkManager());
    CleanArchInjector.init<UserService>(UserService());
    CleanArchInjector.getInstance<NetworkManager>().init();
    CleanArchInjector.init<AppConfig>(
      AppConfig(),
    );
  }
}
