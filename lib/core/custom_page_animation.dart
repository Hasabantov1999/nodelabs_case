// ignore_for_file: deprecated_member_use, use_build_context_synchronously, library_private_types_in_public_api

import 'package:clean_arch/clean_arch.dart';
import 'package:flutter/material.dart';

class CustomPageRoute extends PageRouteBuilder {
  final Widget page;
  final double ovalHeight;
  final double? ovalStartSize;
  CustomPageRoute({
    required this.page,
    required this.ovalHeight,
    this.ovalStartSize,
  }) : super(
          transitionDuration: Duration(milliseconds: 500), // Giriş süresi
          reverseTransitionDuration:
              Duration(milliseconds: 500), // Çıkış süresi
          pageBuilder: (context, animation, secondaryAnimation) => page,
          opaque: false,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeSlideTransition(
              animation: animation,
              secondaryAnimation: secondaryAnimation,
              ovalHeight: ovalHeight,
              ovalStartSize: ovalStartSize,
              child: child,
            );
          },
        );
}

class FadeSlideTransition extends StatefulWidget {
  final Animation<double> animation;
  final Animation<double> secondaryAnimation;
  final Widget child;
  final double ovalHeight;
  final double? ovalStartSize;
  const FadeSlideTransition({
    super.key,
    required this.animation,
    required this.secondaryAnimation,
    required this.child,
    required this.ovalHeight,
    this.ovalStartSize,
  });

  @override
  _FadeSlideTransitionState createState() => _FadeSlideTransitionState();
}

class _FadeSlideTransitionState extends State<FadeSlideTransition>
    with TickerProviderStateMixin {
  late AnimationController _ovalAnimationController;
  late Animation<double> _ovalAnimation;
  late AnimationController _contentOpacityController;
  late AnimationController _backgroundOpacityController;
  bool _isPopping = false;

  @override
  void initState() {
    super.initState();

    // Oval yapı için yukarı hareket animasyonu
    _ovalAnimationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );

    _ovalAnimation = CurvedAnimation(
      parent: _ovalAnimationController,
      curve: Curves.easeOut,
    );

    // Sayfanın içeriğinin opacity animasyonu (oval animasyon tamamlanınca çalışacak)
    _contentOpacityController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _backgroundOpacityController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _backgroundOpacityController.forward().then((val) {
      _contentOpacityController.forward();
    });

    // Oval animasyon bitince içerik opacity animasyonunu başlat
    _ovalAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_isPopping) {
          return false; // Eğer animasyon devam ediyorsa çıkışı engelle
        }
        _isPopping = true;
        _contentOpacityController.reverse().then((val) {
          _backgroundOpacityController.reverse();
        }); // Önce içeriği yok et

        await _ovalAnimationController.reverse(); // Sonra oval kısmı geri indir
        if (mounted) Navigator.of(context).pop(); // Son olarak sayfayı kapat
        return false; // Navigator.pop()'u biz yönetiyoruz
      },
      child: Stack(
        children: [
          // Sayfanın Ana İçeriği (Opacity ile kontrol ediliyor)
          FadeTransition(
            opacity: _backgroundOpacityController,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
              ),
            ),
          ),
          AnimatedBuilder(
            animation: _ovalAnimation,
            builder: (context, child) {
              // Eğer ovalStartSize verilmişse, oval başlangıç pozisyonu o yükseklikten başlasın
              // Verilmemişse, -ovalHeight ile başlasın

              double startPosition = widget.ovalStartSize != null
                  ? ((widget.ovalStartSize ?? 0) - widget.ovalHeight)
                  : -widget.ovalHeight;
              (widget.ovalStartSize ?? -widget.ovalHeight);

              // Animasyon bitiminde ovalin son pozisyonu
              double endPosition = 0;

              // Animasyon değeri ile ovalin hareketi

              double animatedPosition = startPosition +
                  (_ovalAnimation.value * (endPosition - startPosition));

              return Positioned(
                top: animatedPosition, // Oval yukarı doğru hareket ediyor
                left: 0,
                right: 0,
                child: ClipPath(
                  clipper: InverseOvalClipper(),
                  child: Container(
                    height: widget.ovalHeight,
                    color: CA.getTheme.primaryColor,
                  ),
                ),
              );
            },
          ),
          Positioned.fill(
            child: FadeTransition(
              opacity: _contentOpacityController,
              child: widget.child,
            ),
          ),
          // Alttan Yukarı Yükselen Oval Yapı (Opacity değişmez, her zaman 1)
        ],
      ),
    );
  }

  @override
  void dispose() {
    _ovalAnimationController.dispose();
    _contentOpacityController.dispose();
    super.dispose();
  }
}

// ✅ Ters Oval Clipper (Sayfanın altındaki oval şekli oluşturur)
class InverseOvalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, 0); // Sol üst
    path.lineTo(0, size.height); // Sol alt

    // Aşağıya doğru oval
    path.quadraticBezierTo(
      size.width / 2, size.height - 100, // Kontrol noktası
      size.width, size.height, // Sağ alt
    );

    path.lineTo(size.width, 0); // Sağ üst
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
