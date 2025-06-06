// ignore_for_file: use_string_in_part_of_directives

part of splash;

class SplashController extends CleanArchBaseController {
  void init(){
    Future.delayed(const Duration(milliseconds: 300),(){
      CleanArchRouter().go(AppRoutes.Dashboard.route);
    });
  }
}
