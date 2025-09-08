part of '../../contact_us_imports.dart';

class ContactUsBody extends StatelessWidget {
  ContactUsBody({super.key});
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 99, right: 16, left: 16),
      child: Column(
        children: [
          BlocConsumer<ContactUsCubit, ContactUsState>(
            listener: (context, state) {
              if (state is ContactSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("تم إرسال الرسالة بنجاح")),
                );
                _controller.clear();
              } else if (state is ContactFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error)),
                );
              }
            },
            builder: (context, state) {
              return Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Container(
                  color: AppColors.white,
                  height: 310,
                  width: 343,
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
                          width: 311,
                          child: const CustomTextFormField(),
                        ),
                        const SizedBox(height: 16),
                        SizedBox(
                            width: double.infinity,
                            height: 52,
                            child: CustomElevatedButton(
                                onPressed: () {}, text: LocaleKeys.send.tr()))
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 28),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialItem(
                imagePath: AppAssets.svg.whatsapp.path,
                onTap: () {},
              ),
              SizedBox(width: 14),
              SocialItem(
                imagePath: AppAssets.svg.newTwitter.path,
                onTap: () {},
              ), // Instagram
              SizedBox(width: 14),
              SocialItem(
                imagePath: AppAssets.svg.instagram.path,
                onTap: () {},
              ), // Twitter substitute
              SizedBox(width: 14),
              SocialItem(
                imagePath: AppAssets.svg.facebook02.path,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
