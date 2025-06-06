// ignore:
// ignore_for_file: use_build_context_synchronously, use_string_in_part_of_directives, deprecated_member_use

part of dashboard;

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return CleanArchBuilder(
      viewModelBuilder: () => DashboardController(),
      serviceBuilder: () => DashboardService(),
      onViewModelReady: (controller) => controller.init(),
      builder: (context, controller, service) {
        return Scaffold(
          body: controller.isLoading
              ? Center(
                  child: AppLoadingBar(),
                )
              : Stack(
                  children: [
                    AnimatedPositioned(
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 300),
                      top: !controller.animatePage
                          ? context.sized.width * 0.05
                          : -context.sized.width * 0.6,
                      left: !controller.animatePage
                          ? -context.sized.width * 0.5
                          : -context.sized.width * 0.7,
                      child: !controller.circleAnimate
                          ? ZoomIn(
                              duration: Duration(seconds: 1),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                alignment: Alignment.center,
                                curve: Curves.easeInOut,
                                width: !controller.animatePage
                                    ? context.sized.width * 2
                                    : context.sized.width * 4,
                                height: !controller.animatePage
                                    ? context.sized.width * 2
                                    : context.sized.width * 4,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    stops: [
                                      0.1,
                                      0.8,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      CA.getTheme.primaryColor.withOpacity(0.3),
                                      CA.getTheme.primaryColor
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : ZoomOut(
                              duration: Duration(seconds: 1),
                              child: AnimatedContainer(
                                duration: Duration(milliseconds: 300),
                                alignment: Alignment.center,
                                curve: Curves.easeInOut,
                                width: !controller.animatePage
                                    ? context.sized.width * 2
                                    : context.sized.width * 4,
                                height: !controller.animatePage
                                    ? context.sized.width * 2
                                    : context.sized.width * 4,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    stops: [
                                      0.1,
                                      0.8,
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      CA.getTheme.primaryColor.withOpacity(0.3),
                                      CA.getTheme.primaryColor
                                    ],
                                  ),
                                ),
                              ),
                            ),
                    ),
                    Positioned.fill(
                      child: PageView(
                        controller: controller.pageController,
                        onPageChanged: (index) {
                          if (index == 1) {
                            controller.pullDownToAnimate = true;
                            controller.circleAnimate = true;
                          } else {
                            controller.pullDownToAnimate = false;
                            controller.circleAnimate = false;
                          }
                          controller.notifyListeners();
                        },
                        children: [
                          _PageOne(
                            controller: controller,
                          ),
                          _PageTwo(
                            controller: controller,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      width: context.sized.width,
                      bottom: 0 + MediaQuery.paddingOf(context).bottom + 20.w,
                      child: FadeInUp(
                        delay: Duration(seconds: 1),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 125.w,
                              height: 40.w,
                              child: Material(
                                color: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                  side: BorderSide(
                                    color: Colors.white24,
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    controller.goPageOne();
                                  },
                                  borderRadius: BorderRadius.circular(20.r),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SvgPicture.asset(
                                          CA.assets.images("Home.svg"),
                                        ),
                                        SizedBox(
                                          width: 7.w,
                                        ),
                                        CleanArchText(
                                          "Anasayfa",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20.w,
                            ),
                            SizedBox(
                              width: 125.w,
                              height: 40.w,
                              child: Material(
                                color: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.r),
                                  side: BorderSide(
                                    color: Colors.white24,
                                  ),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    controller.goPageTwo();
                                  },
                                  borderRadius: BorderRadius.circular(20.r),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SvgPicture.asset(
                                          CA.assets.images("Profile.svg"),
                                        ),
                                        SizedBox(
                                          width: 7.w,
                                        ),
                                        CleanArchText(
                                          "Profil",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
        );
      },
    );
  }
}




