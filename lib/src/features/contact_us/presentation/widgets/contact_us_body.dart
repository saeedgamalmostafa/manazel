part of '../../contact_us_imports.dart';

class ContactUsBody extends StatelessWidget {
  const ContactUsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final formKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.only(top: 99, right: 16, left: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                color: AppColors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: CustomText.titleLarge(
                              LocaleKeys.sendMessage.tr(),
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(color: AppColors.primary))),
                      const SizedBox(height: 16),
                      CustomText.titleMedium(LocaleKeys.messageText.tr(),
                          textStyle: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(color: AppColors.TextBold)),
                      const SizedBox(height: 4),
                      SizedBox(
                        height: 130,
                        child: Form(
                          key: formKey,
                          child: DefaultTextField(
                            action: TextInputAction.newline,
                            controller: controller,
                            title: LocaleKeys.enterMessage,
                            inputType: TextInputType.multiline,
                            validator: (value) =>
                                Validators.validateEmpty(value),
                            maxLines: 8,
                            style: const TextStyle(
                                color: Colors.black, fontSize: 14),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: LoadingButton(
                            onTap: () async {
                              if (!formKey.currentState!.validate()) return;
                              await context
                                  .read<ContactUsCubit>()
                                  .sendMessage(controller.text);
                            },
                            title: LocaleKeys.send.tr()),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 14.sp,
              children: [
                // SocialItem(
                //   imagePath: AppAssets.svg.whatsapp.path,
                //   onTap: () {},
                // ),
                SocialItem(
                  imagePath: AppAssets.svg.newTwitter.path,
                  onTap: () {
                    LauncherHelper.launchURL(
                        url: 'https://x.com/manazelkwt?s=11');
                  },
                ), // Instagram
                SocialItem(
                  imagePath: AppAssets.svg.instagram.path,
                  onTap: () {
                    LauncherHelper.launchURL(
                        url:
                            'https://www.instagram.com/manazel_kuwait?igsh=MWd5bjZsd3F3dGJ4ZQ%3D%3D&utm_source=qr');
                  },
                ), // Twitter substitute
                SocialItem(
                  imagePath: AppAssets.svg.tiktokIcon.path,
                  onTap: () {
                    LauncherHelper.launchURL(
                        url:
                            'https://www.tiktok.com/@manazel_kuwait?_r=1&_t=ZS-910XxYoNcfd');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
