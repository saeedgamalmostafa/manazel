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
    Future.delayed(Duration(seconds: 3), () {
      Go.pop();
      Go.push(HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: Go.pop,
      child: Padding(
        padding: EdgeInsets.only(top: AppSizes.sH21),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: Image.asset(
                AppAssets.png.predictiveChart.path,
              ),
            ),
            SizedBox(height: AppSizes.sH16),
            CustomText(
              Languages.currentLanguage.locale == const Locale("ar")
                  ? "تم حجز موعدك بنجاح\u{1F44B}"
                  : "Your appointment has been successfully booked\u{1F44B}",
              textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: FontSize.s16,
                  color: AppColors.Text),
            ),
            SizedBox(
              height: AppSizes.sH6,
            ),
            CustomText(
              LocaleKeys.convert_home_page.tr(),
              textStyle:
                  TextStyle(fontSize: FontSize.s14, color: AppColors.SubText),
            ),
          ],
        ),
      ),
    );
  }
}
