import 'package:clean_arch/clean_arch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.backgroundColor,
    required this.onPressed,
    required this.child, this.width,
  });
  final Color? backgroundColor;
  final Function() onPressed;
  final Widget child;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      child: SizedBox(
        width: width,
        child: Material(
          color: backgroundColor ?? Colors.greenAccent.shade100,
          borderRadius: CA.context.border.normalBorderRadius,
          child: Align(
            child: child,
          ),
        ),
      ),
    );
  }
}
