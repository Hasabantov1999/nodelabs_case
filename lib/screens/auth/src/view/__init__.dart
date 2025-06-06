// ignore: use_string_in_part_of_directives
part of auth;

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return CleanArchBuilder(
      viewModelBuilder: () => AuthController(),
      serviceBuilder: () => AuthService(),
      builder: (context, controller, service) {
        return AppKeyboardCloser(
          child: Scaffold(
            body: Stack(
              children: [
                ZoomIn(
                  duration: const Duration(seconds: 2),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                  ),
                ),
                Positioned.fill(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 4,
                        child: FadeInUp(
                          delay: Duration(seconds: 1),
                          child: Column(
                            children: [
                              Builder(builder: (context) {
                                final child = Image.asset(
                                  CA.assets.images(
                                    "SinFlixLogo.png",
                                  ),
                                  width: 100.w,
                                );
                                bool keyboardOpen =
                                    MediaQuery.of(context).viewPadding.bottom >
                                        0;

                                if (!keyboardOpen) {
                                  return const SizedBox.shrink();
                                }
                                return SafeArea(
                                  child: ZoomIn(
                                    duration: const Duration(milliseconds: 300),
                                    child: child,
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 11,
                        child: FadeIn(
                          delay: const Duration(milliseconds: 2300),
                          child: Column(
                            children: [
                              CleanArchText(
                                "Merhabalar",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600),
                              ),
                              context.sized.emptySizedHeightBoxLow,
                              CleanArchText(
                                "Tempus varius a vitae interdum id tortor elementum tristique eleifend at.",
                                width: 236.w,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400),
                              ),
                              context.sized.emptySizedHeightBoxLow3x,
                              FadeInLeft(
                                duration: const Duration(milliseconds: 300),
                                delay: Duration(seconds: 2),
                                child: AppTextField(
                                  controller: controller.emailController,
                                  validator: AppValidators.email,
                                    validationManager:
                                      controller.validationManager,
                                  labelText: "E-Posta",
                                
                                  icon: "Message",
                                ),
                              ),
                              context.sized.emptySizedHeightBoxLow,
                              context.sized.emptySizedHeightBoxLow,
                              FadeInLeft(
                                duration: const Duration(milliseconds: 300),
                                delay: Duration(milliseconds: 2300),
                                child: AppTextField(
                                  controller: controller.passwordController,
                                  labelText: "Şifre",
                                  validator: AppValidators.password,
                                  obscure: true,
                                  validationManager:
                                      controller.validationManager,
                                  icon: "Unlock",
                                ),
                              ),
                              context.sized.emptySizedHeightBoxLow3x,
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: context.padding.horizontalNormal,
                                  child: CleanArchText(
                                    "Şifremi unuttum",
                                    onTap: () {},
                                    style: TextStyle(
                                      color: Colors.white,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              context.sized.emptySizedHeightBoxLow3x,
                              Padding(
                                padding: context.padding.horizontalNormal,
                                child: ValueListenableBuilder(
                                    valueListenable: controller
                                        .validationManager.isFormValid,
                                    builder: (context, isValid, child) {
                                      return AppAsyncButton(
                                        onPressed: !isValid
                                            ? null
                                            : () async {
                                            
                                                await service.login(
                                                  LoginRequestSchema(
                                                    email: controller
                                                        .emailController.text,
                                                    password: controller
                                                        .passwordController
                                                        .text,
                                                  ),
                                                );
                                              },
                                        height: 53.w,
                                        child: CleanArchText(
                                          "Giriş Yap",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                              Expanded(
                                child: Builder(builder: (context) {
                                  bool keyboardOpen = MediaQuery.of(context)
                                          .viewPadding
                                          .bottom >
                                      0;
                                  if (!keyboardOpen) {
                                    return const SizedBox.shrink();
                                  }
                                  return Column(
                                    children: [
                                      context.sized.emptySizedHeightBoxLow3x,
                                      AppExtraLoginComp(),
                                      Spacer(),
                                      AppRedirectRegisterComp(),
                                      SizedBox(
                                        height: 13.w,
                                      ),
                                    ],
                                  );
                                }),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
