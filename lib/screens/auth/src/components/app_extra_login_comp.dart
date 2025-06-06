import 'package:animate_do/animate_do.dart';
import 'package:clean_arch/clean_arch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppExtraLoginComp extends StatelessWidget {
  const AppExtraLoginComp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _Widget(
            icon: "Google",
            onPressed: () {},
          ),
          _Widget(
            icon: "Apple",
            onPressed: () {},
          ),
          _Widget(
            icon: "Facebook",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _Widget extends StatelessWidget {
  const _Widget({
    required this.icon,
    required this.onPressed,
  });
  final String icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 13.w),
      child: FadeIn(
        child: SizedBox(
          width: 60.w,
          height: 60.w,
          child: Material(
            color: Colors.white10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.r),
            ),
            child: InkWell(
              onTap: onPressed,
              borderRadius: BorderRadius.circular(18.r),
              child: Align(
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  CA.assets.images(
                    "$icon.svg",
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
