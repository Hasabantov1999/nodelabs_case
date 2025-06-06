// ignore: use_string_in_part_of_directives
part of sign_up;

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return CleanArchBuilder(
      viewModelBuilder: () => SignUpController(),
      serviceBuilder: () => SignUpService(),
      builder: (context, controller, service) {
        return AppKeyboardCloser(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              leading: BackButton(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.transparent,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CleanArchText(
                  "Hoşgeldiniz",
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
                  child: AppTextField(
                    labelText: "Ad Soyad",
                    icon: "Add-User",
                    controller: controller.nameController,
                    validator: AppValidators.name,
                    validationManager: controller.validationManager,
                  ),
                ),
                context.sized.emptySizedHeightBoxLow,
                context.sized.emptySizedHeightBoxLow,
                FadeInLeft(
                  duration: const Duration(milliseconds: 300),
                  delay: Duration(milliseconds: 300),
                  child: AppTextField(
                    labelText: "E-Posta",
                    icon: "Message",
                    controller: controller.emailController,
                    validator: AppValidators.email,
                    validationManager: controller.validationManager,
                  ),
                ),
                context.sized.emptySizedHeightBoxLow,
                context.sized.emptySizedHeightBoxLow,
                FadeInLeft(
                  duration: const Duration(milliseconds: 300),
                  delay: Duration(milliseconds: 600),
                  child: AppTextField(
                    labelText: "Şifre",
                    obscure: true,
                    icon: "Unlock",
                    controller: controller.passwordController,
                    validator: AppValidators.password,
                    validationManager: controller.validationManager,
                  ),
                ),
                context.sized.emptySizedHeightBoxLow,
                context.sized.emptySizedHeightBoxLow,
                FadeInLeft(
                  duration: const Duration(milliseconds: 300),
                  delay: Duration(milliseconds: 900),
                  child: AppTextField(
                    labelText: "Şifre Tekrar",
                    obscure: true,
                    icon: "Unlock",
                    controller: controller.rePasswordController,
                    validator: (val) {
                      if (val == null || val.trim().isEmpty) {
                        return 'Şifre zorunludur';
                      }
                      if (val.length < 6) {
                        return 'Şifre en az 6 karakter olmalı';
                      }
                      if (val != controller.passwordController.text) {
                        return 'Şifreler birbiriyle eşleşmeli';
                      }
                      return null;
                    },
                    validationManager: controller.validationManager,
                  ),
                ),
                context.sized.emptySizedHeightBoxLow,
                context.sized.emptySizedHeightBoxLow,
                Padding(
                  padding: context.padding.horizontalNormal,
                  child: FadeIn(
                    duration: const Duration(milliseconds: 300),
                    delay: Duration(milliseconds: 1200),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: Colors.white54,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                        children: [
                          TextSpan(
                            text: "Kullanıcı sözleşmesini ",
                          ),
                          TextSpan(
                            text: "okudum ve kabul ediyorum.",
                            recognizer: TapGestureRecognizer()..onTap = () {},
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white,
                            ),
                          ),
                          TextSpan(
                            text: "Bu sözelşmeyi okuyarak devam ediniz lütfen.",
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                context.sized.emptySizedHeightBoxLow3x,
                Padding(
                  padding: context.padding.horizontalNormal,
                  child: FadeIn(
                    duration: const Duration(milliseconds: 300),
                    delay: Duration(milliseconds: 1200),
                    child: ValueListenableBuilder(
                        valueListenable:
                            controller.validationManager.isFormValid,
                        builder: (context, isValid, child) {
                          return AppAsyncButton(
                            onPressed: !isValid
                                ? null
                                : () async {
                                    await service.register(
                                      RegisterRequestSchema(
                                        email: controller.emailController.text,
                                        name: controller.nameController.text,
                                        password:
                                            controller.passwordController.text,
                                      ),
                                    );
                                  },
                            height: 53.w,
                            child: CleanArchText(
                              "Kayıt Ol",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                Expanded(
                  child: FadeIn(
                    duration: const Duration(milliseconds: 300),
                    delay: Duration(milliseconds: 1500),
                    child: Builder(builder: (context) {
                      bool keyboardOpen =
                          MediaQuery.of(context).viewPadding.bottom > 0;
                      if (!keyboardOpen) {
                        return const SizedBox.shrink();
                      }
                      return Column(
                        children: [
                          context.sized.emptySizedHeightBoxLow3x,
                          AppExtraLoginComp(),
                          Spacer(),
                          AppRedirectLoginComp(),
                          SizedBox(
                            height: 13.w,
                          ),
                        ],
                      );
                    }),
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
