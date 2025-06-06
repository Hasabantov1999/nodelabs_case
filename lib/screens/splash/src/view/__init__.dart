// ignore: use_string_in_part_of_directives
part of splash;

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return CleanArchBuilder(
      viewModelBuilder: () => SplashController(),
      serviceBuilder: () => SplashService(),
      onViewModelReady: (controller)=>controller.init(),
      builder: (context, controller, service) {
        return Image.asset(
          CA.assets.images("SinFlixSplash.png"),
        );
      },
    );
  }
}
