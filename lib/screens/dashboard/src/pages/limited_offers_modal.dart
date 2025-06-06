import 'package:clean_arch/clean_arch.dart';
import 'package:flutter/material.dart';

class LimitedOffersModal extends StatelessWidget {
  const LimitedOffersModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(13.r),
        topRight: Radius.circular(13.r),
      ),
      child: Image.asset(
        CA.assets.images(
          "limited_offers.png",
        ),
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
