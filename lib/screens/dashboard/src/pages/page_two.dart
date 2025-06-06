part of dashboard;

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
                    child: Row(
                      children: [
                        SizedBox(
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
                        SizedBox(
                          width: 10.w,
                        ),
                        SizedBox(
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
                                Navigator.of(context).push(
                                  CustomPageRoute(
                                    page: SettingsView(),
                                    ovalStartSize: 0,
                                    ovalHeight:
                                        MediaQuery.paddingOf(context).top +
                                            10.w,
                                  ),
                                );
                              },
                              customBorder: CircleBorder(),
                              child: Align(
                                alignment: Alignment.center,
                                child: Icon(
                                  Icons.settings,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
                      "ID: ${user.id!.substring(0, 7)}",
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
