part of '../../book_appointment_imports.dart';

class BookDoneBottomSheet extends StatefulWidget {
  const BookDoneBottomSheet({super.key});

  @override
  State<BookDoneBottomSheet> createState() => _BookDoneBottomSheetState();
}

class _BookDoneBottomSheetState extends State<BookDoneBottomSheet> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Go.pop();
      Go.push(const AppLayoutScreen(currentIndex: 0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppSizes.sH21),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AppAssets.lottie.done.lottie(width: double.infinity, height: 150.h),
          SizedBox(height: AppSizes.sH16),
          CustomText.titleLarge(
            Languages.currentLanguage.locale == const Locale("ar")
                ? "تم حجز موعدك بنجاح\u{1F44B}"
                : "Your appointment has been successfully booked\u{1F44B}",
            textStyle: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold, color: AppColors.Text),
          ),
          SizedBox(
            height: AppSizes.sH6,
          ),
          CustomText.titleMedium(
            LocaleKeys.convertHomePage.tr(),
            textStyle: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: AppColors.SubText),
          ),
        ],
      ),
    );
  }
}
