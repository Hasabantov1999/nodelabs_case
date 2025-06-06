import 'package:clean_arch/clean_arch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.labelText,
    required this.icon,
    this.obscure = false,
    this.controller,
    this.validationManager,
    this.validator
  });
  final String labelText;
  final String icon;
  final bool obscure;
  final TextEditingController? controller;
  final ValidationManager? validationManager;
   final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> obscureText = ValueNotifier(false);
    return ValueListenableBuilder(
        valueListenable: obscureText,
        builder: (context, isObscure, child) {
          return Padding(
            padding: context.padding.horizontalNormal,
            child: CleanArchFormLabel(
              label: labelText,
              validationManager: validationManager,
              validator: validator,
              controller: controller,
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              obscureText: isObscure,
              decoration: InputDecoration(
                labelText: labelText,
                prefixIcon: Padding(
                  padding: EdgeInsets.only(
                      top: 5.w, bottom: 5.w, left: 13.w, right: 13.w),
                  child: SvgPicture.asset(
                    CA.assets.images("$icon.svg"),
                  ),
                ),
                suffixIcon: obscure
                    ? IconButton(
                        onPressed: () {
                          obscureText.value = !obscureText.value;
                        },
                        icon: (!isObscure
                            ? Icon(
                                Icons.visibility_off,
                              )
                            : Icon(
                                Icons.visibility,
                              )),
                      )
                    : SizedBox.shrink(),
              ),
            ),
          );
        });
  }
}
