part of '../../book_appointment_imports.dart';

class BookAppointmentScreen extends StatelessWidget {
  const BookAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        appBar: CustomAppBar(
          title: LocaleKeys.bookInspection.tr(),
          showBackArrow: true,
        ),
        body: BookAppointmentBody(),
        bottomNavigationBar: Padding(
            padding: EdgeInsets.only(
                top: AppSizes.sH16,
                bottom: AppSizes.sH35,
                right: AppSizes.sW16,
                left: AppSizes.sW16),
            child: CustomElevatedButton(
              onPressed: () {
                showDefaultBottomSheet(child: BookDoneBottomSheet());
              },
              text: LocaleKeys.send.tr(),
            )));
  }
}
