// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:clean_arch/clean_arch.dart';
import 'package:clean_arch/clean_arch_router/clean_arch_router.dart';
import 'package:http/http.dart' as http;
import 'package:sinflix_app/core/storage_keys.dart';
import 'package:sinflix_app/screens/auth/auth.dart';

extension ErrorHandler on http.Response? {
  R throwOrExceptionModel<R extends NetworkSchema>({required R model}) {
    if (this == null) {
      throw Exception("Sunucuya ulaşılamadı.");
    }

    final response = this!;
    switch (response.statusCode) {
      case 200:
        final data = json.decode(response.body);
        return model.fromJson(data['data']);
      case 401:
        _navigateToLogin();
        throw Exception("Oturum süresi doldu.");
      case 400:
        final data = jsonDecode(response.body);
        CleanArchAlerts.show(
          type: SnackyType.error,
          title: data["response"]['code'].toString(),
          subtitle: data["response"]['message'].toString(),
        );
        if(data['response']['message']=="TOKEN_UNAVAILABLE"){
          _navigateToLogin();
        }
        throw Exception(data["response"]['message'].toString());
      default:
        throw Exception("Bir hata oluştu: ${response.statusCode}");
    }
  }

  void _navigateToLogin() {
    CleanArchStorage.instance.remove(StorageKeys.token.name);
    CleanArchRouter().go(
      CleanArchRoute(mobile: AuthView(), path: "/auth"),
    );
  }
}

abstract class NetworkSchema<R> {
  Map<String, dynamic> toJson();
  R fromJson(Map<String, dynamic> json);
}
