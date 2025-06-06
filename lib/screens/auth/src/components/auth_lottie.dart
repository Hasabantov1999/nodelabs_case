import 'package:clean_arch/clean_arch.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AuthLottie extends StatefulWidget {
  const AuthLottie({
    super.key,
    required this.onInit,
  });
  final Function(AnimationController controller) onInit;
  @override
  State<AuthLottie> createState() => _AuthLottieState();
}

class _AuthLottieState extends State<AuthLottie>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3), // Animasyonun tam süresi
    );

    // Başlangıçta belirli bir frame'e git
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        _controller.animateTo(0.5);
      },
    );
    widget.onInit(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      controller: _controller,
      repeat: false,
      CA.assets.lottie(
        "auth.json",
      ),
    );
  }
}
