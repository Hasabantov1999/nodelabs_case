import 'package:clean_arch/clean_arch.dart';
import 'package:flutter/material.dart';
import 'package:sinflix_app/core/custom_page_animation.dart';
import 'package:sinflix_app/screens/sign_up/sign_up.dart';

class AppRedirectRegisterComp extends StatelessWidget {
  const AppRedirectRegisterComp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              CustomPageRoute(
                page: SignUpView(),
                ovalStartSize: 0 ,
                ovalHeight: CA.context.sized.height * 0.1,
              ),
            );
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CleanArchText(
                "Bir hesabın yok mu?",
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(
                width: 13.w,
              ),
              CleanArchText(
                "Kayıt Ol!",
      
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
