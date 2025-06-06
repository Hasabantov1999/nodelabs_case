// ignore_for_file: unused_field, unused_element

import 'package:clean_arch/clean_arch.dart';
import 'package:flutter/material.dart';

class AppAsyncButton extends StatefulWidget {
  const AppAsyncButton({
    super.key,
    this.padding,
    this.borderRadius,
    this.color,
    required this.child,
    required this.onPressed,
    this.width,
    this.height,
  });
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final Color? color;
  final Widget child;
  final Future<void> Function()? onPressed;
  final double? width;
  final double? height;

  @override
  State<AppAsyncButton> createState() => _AppAsyncButtonState();
}

class _AppAsyncButtonState extends State<AppAsyncButton> {
  ValueNotifier<_ButtonStatus> status = ValueNotifier(_ButtonStatus.normal);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: status,
      builder: (context, status, child) {
        switch (status) {
          case _ButtonStatus.normal:
            return _normal(context);

          case _ButtonStatus.whenLoseOpacity:
            return _whenLoseOpacity(context);
          case _ButtonStatus.whenSmalling:
            return _whenSmalling(context);
          case _ButtonStatus.whenLoseOpacityRect:
            return _whenLoseOpacityRect(context);
          case _ButtonStatus.loading:
            return _loading(context);
          case _ButtonStatus.loadingEnd:
            return _loadingEnd(context);
          case _ButtonStatus.whenWinOpacityRect:
            return _whenWinOpacityRect(context);
          case _ButtonStatus.whenBigger:
            return _whenBigger(context);
          case _ButtonStatus.whenWinOpacity:
            return _whenWinOpacity(context);
        }
      },
    );
  }

  Widget _normal(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: SizedBox(
        width: widget.width ?? context.sized.width,
        height: widget.height ?? 57,
        child: ElevatedButton(
          onPressed:
              widget.onPressed == null
                  ? null
                  : () {
                    status.value = _ButtonStatus.whenLoseOpacity;
                  },

          style: ElevatedButton.styleFrom(
            disabledBackgroundColor: CA.getTheme.primaryColor.withValues(alpha: 0.3),
            shape: RoundedRectangleBorder(
              borderRadius:
                  widget.borderRadius ?? BorderRadius.circular(18),
            ),
            backgroundColor: widget.color ?? CA.getTheme.primaryColor,
            
          ),
          child: widget.child,
        ),
      ),
    );
  }

  Widget _whenLoseOpacity(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: SizedBox(
        width: widget.width ?? context.sized.width,
        height: widget.height ?? 57,
        child: ElevatedButton(
          onPressed: () {},

          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius:
                  widget.borderRadius ?? BorderRadius.circular(18),
            ),
            backgroundColor: widget.color ?? CA.getTheme.primaryColor,
          ),
          child: TweenAnimationBuilder(
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear,
            onEnd: () {
              status.value = _ButtonStatus.whenSmalling;
            },
            tween: Tween(begin: 1.0, end: 0.0),
            builder: (context, opacity, ch) {
              return Opacity(opacity: opacity, child: widget.child);
            },
          ),
        ),
      ),
    );
  }

  Widget _whenSmalling(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: TweenAnimationBuilder(
        onEnd: () {
          status.value = _ButtonStatus.whenLoseOpacityRect;
        },
        tween: Tween(
          begin: widget.width ?? context.sized.width,
          end: widget.height ?? 57,
        ),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        builder: (context, wd, ch) {
          return SizedBox(
            width: wd,
            height: widget.height ?? 57,
            child: ElevatedButton(
              onPressed: () {},

              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      widget.borderRadius ?? BorderRadius.circular(18),
                ),
                backgroundColor:
                    widget.color ?? CA.getTheme.primaryColor,
              ),
              child: Opacity(opacity: 0, child: widget.child),
            ),
          );
        },
      ),
    );
  }

  Widget _whenLoseOpacityRect(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 1.0, end: 0.0),
      duration: const Duration(milliseconds: 200),
      onEnd: () {
        status.value = _ButtonStatus.loading;
      },
      builder: (context, opacity, child) {
        return Opacity(
          opacity: opacity,
          child: Padding(
            padding: widget.padding ?? EdgeInsets.zero,
            child: SizedBox(
              width: widget.height ?? 57,
              height: widget.height ?? 57,
              child: ElevatedButton(
                onPressed: () {},

                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        widget.borderRadius ??
                        BorderRadius.circular(18),
                  ),
                  backgroundColor:
                      widget.color ?? CA.getTheme.primaryColor,
                ),
                child: Opacity(opacity: 0, child: widget.child),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _loading(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 300),
      onEnd: () {
        Future.delayed(const Duration(milliseconds: 300), () async {
          await widget.onPressed?.call().onError((e, ex) {
            status.value = _ButtonStatus.loadingEnd;
          });
          status.value = _ButtonStatus.loadingEnd;
        });
      },
      curve: Curves.easeInOut,
      builder: (context, opacity, child) {
        return Opacity(
          opacity: opacity,
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: widget.height ?? 57,
              height: widget.height ?? 57,
              child: _loadingIndicator(),
            ),
          ),
        );
      },
    );
  }

  Widget _loadingEnd(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 1.0, end: 0.0),
      onEnd: () => status.value = _ButtonStatus.whenWinOpacityRect,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      builder: (context, opacity, child) {
        return Opacity(
          opacity: opacity,
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: widget.height ?? 57,
              height: widget.height ?? 57,
              child: _loadingIndicator(),
            ),
          ),
        );
      },
    );
  }

  Widget _loadingIndicator() => CircularProgressIndicator(
    color: widget.color ?? CA.getTheme.primaryColor,
    strokeWidth: 4,
    trackGap: 100,
    strokeCap: StrokeCap.round,
    strokeAlign: 0,
  );

  Widget _whenWinOpacityRect(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 200),
      onEnd: () {
        status.value = _ButtonStatus.whenBigger;
      },
      builder: (context, opacity, child) {
        return Opacity(
          opacity: opacity,
          child: Padding(
            padding: widget.padding ?? EdgeInsets.zero,
            child: SizedBox(
              width: widget.height ?? 57,
              height: widget.height ?? 57,
              child: ElevatedButton(
                onPressed: () {},

                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        widget.borderRadius ??
                        BorderRadius.circular(18),
                  ),
                  backgroundColor:
                      widget.color ?? CA.getTheme.primaryColor,
                ),
                child: Opacity(opacity: 0, child: widget.child),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _whenBigger(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: TweenAnimationBuilder(
        onEnd: () {
          status.value = _ButtonStatus.whenWinOpacity;
        },
        tween: Tween(
          begin: widget.height ?? 57,
          end: widget.width ?? context.sized.width,
        ),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        builder: (context, wd, ch) {
          return SizedBox(
            width: wd,
            height: widget.height ?? 57,
            child: ElevatedButton(
              onPressed: () {},

              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius:
                      widget.borderRadius ?? BorderRadius.circular(18),
                ),
                backgroundColor:
                    widget.color ?? CA.getTheme.primaryColor,
              ),
              child: Opacity(opacity: 0, child: widget.child),
            ),
          );
        },
      ),
    );
  }

  Widget _whenWinOpacity(BuildContext context) {
    return Padding(
      padding: widget.padding ?? EdgeInsets.zero,
      child: SizedBox(
        width: widget.width ?? context.sized.width,
        height: widget.height ?? 57,
        child: ElevatedButton(
          onPressed: () {},

          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius:
                  widget.borderRadius ?? BorderRadius.circular(18),
            ),
            backgroundColor: widget.color ?? CA.getTheme.primaryColor,
          ),
          child: TweenAnimationBuilder(
            duration: const Duration(milliseconds: 200),
            curve: Curves.linear,
            onEnd: () {
              status.value = _ButtonStatus.normal;
            },
            tween: Tween(begin: 0.0, end: 1.0),
            builder: (context, opacity, ch) {
              return Opacity(opacity: opacity, child: widget.child);
            },
          ),
        ),
      ),
    );
  }
}

enum _ButtonStatus {
  normal,
  whenLoseOpacity,
  whenSmalling,
  whenLoseOpacityRect,
  loading,
  loadingEnd,
  whenWinOpacityRect,
  whenBigger,
  whenWinOpacity,
}
