import 'package:animate_do/animate_do.dart';
import 'package:clean_arch/clean_arch.dart';
import 'package:flutter/material.dart';

class AppAlert {
  static Future<bool> show({
    required String title,
    required String description,
    String? cancelText,
    required String activeText,
  }) async {
    final res = await showDialog(
      context: CA.context,
      barrierDismissible: false,
      builder: (context) {
        return _AppAlert(
          title: title,
          description: description,
          cancelText: cancelText,
          activeText: activeText,
        );
      },
    );
    if (res is bool && res) {
      return true;
    }
    return false;
  }
}

class _AppAlert extends StatelessWidget {
  const _AppAlert({
    required this.title,
    required this.description,
    this.cancelText,
    required this.activeText,
  });
  final String title;
  final String description;
  final String? cancelText;
  final String activeText;
  @override
  Widget build(BuildContext context) {
    return ZoomIn(
      child: Padding(
        padding: context.padding.horizontalNormal,
        child: Dialog(
          backgroundColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 13, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    CleanArchText(
                      title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Spacer(),
                    CloseButton(),
                  ],
                ),
                CleanArchText(
                  description,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 13),
                Row(
                  children: [
                    if (cancelText != null)
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context, false);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xffF3F6FB),
                          ),
                          child: CleanArchText(
                            cancelText!,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    if (cancelText != null) SizedBox(width: 13),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CA.getTheme.primaryColor,
                        ),
                        child: CleanArchText(
                          activeText,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
