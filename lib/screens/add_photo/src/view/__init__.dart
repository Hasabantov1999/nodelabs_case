// ignore: use_string_in_part_of_directives
// ignore_for_file: use_build_context_synchronously

part of '../../add_photo.dart';

class AddPhotoView extends StatelessWidget {
  const AddPhotoView({super.key});

  @override
  Widget build(BuildContext context) {
    return CleanArchBuilder(
      viewModelBuilder: () => AddPhotoController(),
      serviceBuilder: () => AddPhotoService(),
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
                          "Profil Detayı",
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
              context.sized.emptySizedHeightBoxLow3x,
              Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CleanArchText(
                      "Fotoğraflarınızı Yükleyin",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 7.w,
                    ),
                    CleanArchText(
                      "Resources out incentivize relaxation floor loss cc.",
                      width: 188.w,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              context.sized.emptySizedHeightBoxLow3x,
              SizedBox(
                width: 164.w,
                height: 164.w,
                child: Material(
                  color: Colors.white10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                    side: BorderSide(
                      color: Colors.white24,
                    ),
                  ),
                  child: ValueListenableBuilder(
                      valueListenable: controller.state,
                      builder: (context, state, child) {
                        if (state == PhotoState.empty) {
                          return InkWell(
                            onTap: () async {
                              final photo = await showImagePicker(context);
                              controller.photo = photo;
                              controller.notifyListeners();
                              if (photo != null) {
                                service.uploadImageWithProgress(
                                  file: File(photo.path),
                                  onProgress: (per) {
                                    controller.loadPer = per;
                                    controller.notifyListeners();
                                  },
                                  onDone: () async {
                                    controller.state.value = PhotoState.done;
                                    CleanArchAlerts.show(
                                        title: "Fotoğraf Başarıyla Yüklendi");
                                    await Future.delayed(
                                        const Duration(milliseconds: 300));
                                    CleanArchInjector.getInstance<UserService>()
                                        .getUser();
                                    Navigator.maybePop(context);
                                  },
                                  onError: (err) {},
                                );
                              }
                            },
                            borderRadius: BorderRadius.circular(15.r),
                            child: Align(
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 30.w,
                              ),
                            ),
                          );
                        }
                        if (state == PhotoState.loading) {
                          return Align(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(
                              color: Colors.white24,
                              backgroundColor: Colors.white10,
                              value: controller.loadPer,
                            ),
                          );
                        }
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(15.r),
                          child: Image.file(
                            File(controller.photo!.path),
                            fit: BoxFit.fill,
                          ),
                        );
                      }),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
