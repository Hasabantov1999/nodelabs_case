import 'package:clean_arch/clean_arch.dart';

class NetworkManager {
  String baseUrl = "https://caseapi.servicelabs.tech";

  void init() {
    CleanArchNetworkManager.instance.init(
      baseUrl: baseUrl,
      onError: (error) {
        return () {};
      },
    );
  }
}
