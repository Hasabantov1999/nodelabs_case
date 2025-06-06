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

class _PageTwo extends StatefulWidget {
  const _PageTwo({
    required this.controller,
  });
  final DashboardController controller;

  @override
  State<_PageTwo> createState() => _PageTwoState();
}

class _PageTwoState extends State<_PageTwo>
    with AutomaticKeepAliveClientMixin<_PageTwo> {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        SafeArea(
          child: SizedBox(
            height: 50.w,
            width: context.sized.width,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: context.padding.horizontalNormal,
                    child: SizedBox(
                      width: 45.w,
                      height: 45.w,
                      child: Material(
                        color: Colors.white10,
                        shape: CircleBorder(
                          side: BorderSide(
                            color: Colors.white24,
                          ),
                        ),
                        child: InkWell(
                          onTap: () {
                            widget.controller.goPageOne();
                          },
                          customBorder: CircleBorder(),
                          child: Align(
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: CleanArchText(
                    "Profil Detayı",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: context.padding.horizontalNormal,
                    child: SizedBox(
                      width: 100.w,
                      height: 30.w,
                      child: Material(
                        color: CA.getTheme.primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(53.r),
                        ),
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return LimitedOffersModal();
                              },
                            );
                          },
                          customBorder: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(53.r),
                          ),
                          child: Align(
                              alignment: Alignment.center,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SvgPicture.asset(
                                    CA.assets.images(
                                      "ProfileDiamond.svg",
                                    ),
                                  ),
                                  SizedBox(
                                    width: 7,
                                  ),
                                  CleanArchText(
                                    "Sınırlı Teklif",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              )),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Builder(builder: (context) {
          UserProfileResponseSchema user =
              CleanArchInjector.getInstance<UserService>().user;
          return Padding(
            padding: context.padding.horizontalNormal,
            child: Row(
              children: [
                CachedNetworkImage(
                  imageUrl: user.photoUrl ?? "",
                  width: 45.w,
                  height: 45.w,
                  errorWidget: (c, u, e) {
                    return Image.asset(
                      CA.assets.images("profile_photo_example.png"),
                    );
                  },
                ),
                SizedBox(
                  width: 7.w,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name ?? "",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "ID: ${user.id!.substring(0,7)}",
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                SizedBox(
                  width: 121.w,
                  height: 36.w,
                  child: Material(
                    color: CA.getTheme.primaryColor,
                    borderRadius: BorderRadius.circular(10.r),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          CustomPageRoute(
                            page: AddPhotoView(),
                            ovalStartSize: 0,
                            ovalHeight:
                                MediaQuery.paddingOf(context).top + 10.w,
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(10.r),
                      child: Align(
                        alignment: Alignment.center,
                        child: CleanArchText(
                          "Fotoğraf Ekle",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
        context.sized.emptySizedHeightBoxLow3x,
        Padding(
          padding: context.padding.horizontalNormal,
          child: Align(
            alignment: Alignment.centerLeft,
            child: CleanArchText(
              "Beğendiğim Filmler",
              style: TextStyle(
                color: Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        context.sized.emptySizedHeightBoxLow3x,
        Expanded(
          child: FutureBuilder(
              future: CleanArchInjector.getInstance<TransactionsRepository>()
                  .getFavoriteMovies(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return AppLoadingBar();
                }
                if ((snapshot.data?.movies?.length ?? 0) == 0) {
                  return CleanArchText(
                    "Herhangi bir favori filminizi bulunamadı!",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  );
                }
                return GridView.builder(
                  itemCount: snapshot.data?.movies?.length,
                  padding: EdgeInsets.only(bottom: 100.w),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 250.w,
                  ),
                  itemBuilder: (context, index) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              CA.assets.images("example_profile_movie.png"),
                            ),
                            SizedBox(
                              height: 10.w,
                            ),
                            Text(
                              "Aşk, Ekmek, Hayaller",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 7.w,
                            ),
                            Text(
                              "Adam Yapım",
                              style: TextStyle(
                                color: Colors.white54,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        )
                      ],
                    );
                  },
                );
              }),
        )
      ],
    );
  }
}

class _PageOne extends StatefulWidget {
  const _PageOne({
    required this.controller,
  });
  final DashboardController controller;

  @override
  State<_PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<_PageOne>
    with AutomaticKeepAliveClientMixin<_PageOne> {
  @override
  bool get wantKeepAlive => true; // Sayfanın durumu korunacak
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return PageView.builder(
      controller: widget.controller.moviePageController,
      scrollDirection: Axis.vertical,
      itemCount: widget.controller.movies.length,
      itemBuilder: (context, index) {
        return MovieComponent(
          controller: widget.controller,
          movie: widget.controller.movies[index],
        );
      },
    );
  }
}

class MovieComponent extends StatelessWidget {
  const MovieComponent({
    super.key,
    required this.movie,
    required this.controller,
  });
  final Movies movie;
  final DashboardController controller;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: FadeIn(
            delay: Duration(seconds: 1),
            child: Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: movie.poster ?? "",
                  errorWidget: (context, url, error) {
                    return Image.asset(
                      CA.assets.images(
                        "Dashboard_ExampleBg.png",
                      ),
                    );
                  },
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 140.w) +
                        context.padding.horizontalNormal,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: FutureBuilder(
                              future: CleanArchInjector.getInstance<
                                      TransactionsRepository>()
                                  .getFavoriteMovies(),
                              builder: (context, snapshot) {
                                bool isFav = false;
                                for (var mov
                                    in snapshot.data?.movies ?? <Movies>[]) {
                                  if (mov.id == movie.id) {
                                    isFav = true;
                                  }
                                }
                                return FavoriteButton(
                                  isFavorite: isFav,
                                  valueChanged: (favorite) {
                                    CleanArchInjector.getInstance<
                                            TransactionsRepository>()
                                        .addFavorite(
                                      movie.id ?? "",
                                    );
                                  },
                                );
                              }),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              CA.assets.images("home_example_movie_logo.svg"),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CleanArchText(
                                  movie.title ?? "",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(
                                  width: 278.w,
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      children: [
                                        TextSpan(text: movie.description ?? ""),
                                        TextSpan(
                                          text: "Daha Fazlası",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: 100.w +
              MediaQuery.paddingOf(context)
                  .bottom, // karanlık kısmın yüksekliği
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.2],
                colors: [
                  Colors.transparent,
                  Colors.black,
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
