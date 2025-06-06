import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppKeyboardCloser extends StatelessWidget {
  const AppKeyboardCloser({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        SystemChannels.textInput.invokeMethod('TextInput.hide');
      },
      child: child,
    );
  }
}
