import 'package:clean_arch/clean_arch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:sinflix_app/core/auth_middleware.dart';
import 'package:sinflix_app/repository/__init__.dart';
import 'package:sinflix_app/screens/dashboard/dashboard.dart';
import 'package:sinflix_app/screens/splash/splash.dart';
import 'package:sinflix_app/services/user_service.dart';
import 'screens/auth/auth.dart';
part 'themes/app_themes.dart';
part 'routes/routes.dart';
part 'routes/middle_ware.dart';
void main() => CleanArchApp.build(  
      mainFuture: () async {
        WidgetsBinding widgetsBinding =
            WidgetsFlutterBinding.ensureInitialized();
        FlutterNativeSplash.preserve(
          widgetsBinding: widgetsBinding,
        );
      },
      config: ".env",
      sentryOptions: null,
      init: () async {
        RepositoryInjection.instance.init();
        FlutterNativeSplash.remove();
      },
      
      oriantationModes: null,
      firebase: null,
      sentryNavigatorObserver: false,
      performanceNavigatorObserver: false,
      serviceLog: null,
      adaptiveCacheTheme: true,
      themes: _appThemes,
      initialTheme: "light",
      
      home: AppRoutes.Splash.route,
      mainLocale: CleanArchLocale(
        locale: "tr",
      ),
      designSize: Size(402, 844)
    );
