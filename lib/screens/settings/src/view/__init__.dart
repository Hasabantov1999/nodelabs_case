// ignore: use_string_in_part_of_directives
part of settings;

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CleanArchBuilder(
      viewModelBuilder: () => SettingsController(),
      serviceBuilder: () => SettingsService(),
      builder: (context, controller, service) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
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
                                  Navigator.maybePop(context);
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
                          "Ayarlar",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                onTap: () async {
                  var res = await CleanArchRouter().push(
                    CleanArchRoute(
                      mobile: SelectableView<SelectLanguage>(
                        builder: (context, lang) {
                          return ListTile(
                            onTap: () {
                              Navigator.pop(context, lang);
                            },
                            title: CleanArchText(
                              lang.lang,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        },
                        items: controller.languages,
                      ),
                      path: "/language_select",
                    ),
                  );
                  if (res is SelectLanguage) {
                    CA.changeLocale(
                      CleanArchLocale(
                        locale: res.key,
                      ),
                    );
                  }
                },
                leading: Icon(
                  Icons.language,
                  color: Colors.white,
                ),
                title: CleanArchText(
                  "Dil",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              ListTile(
                onTap: () async {
                  final alertRes = await AppAlert.show(
                    title: "Çıkış Yap",
                    description: "Çıkış yapmak istediğinize emin misiniz?",
                    activeText: "Çıkış Yap",
                    cancelText: "Vazgeç",
                  );
                  if (alertRes) {
                    await CleanArchStorage.instance.remove(
                      StorageKeys.token.name,
                    );

                    CleanArchRouter().go(
                      AppRoutes.Auth.route,
                    );
                  }
                },
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                title: CleanArchText(
                  "Çıkış Yap",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
