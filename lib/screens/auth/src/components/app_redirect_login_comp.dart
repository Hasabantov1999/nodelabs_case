import 'package:clean_arch/clean_arch.dart';
import 'package:flutter/material.dart';


class AppRedirectLoginComp extends StatelessWidget {
  const AppRedirectLoginComp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Align(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
           Navigator.maybePop(context);
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CleanArchText(
                "Zaten bir hesabın var mı?",
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
                "Giriş Yap!",
      
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
