import 'package:clean_arch/clean_arch.dart';
import 'package:flutter/material.dart';

class AppLoadingBar extends StatelessWidget {
  const AppLoadingBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
              child: TweenAnimationBuilder(
                duration: const Duration(milliseconds: 300),
                tween: Tween<double>(begin: 0, end: 1),
                builder: (context, scale, child) {
                  return Transform.scale(
                    scale: scale,
                    child: CircularProgressIndicator(
                      color: CA.getTheme.primaryColor,
                      backgroundColor: Colors.white,
                    ),
                  );
                },
              ),
            );
  }
}