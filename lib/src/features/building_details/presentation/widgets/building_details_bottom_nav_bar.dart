part of '../../building_details_imports.dart';

class BuildingDetailsBottomNavBar extends StatelessWidget {
  final String phone;
  final int id;
  const BuildingDetailsBottomNavBar(
      {super.key, required this.phone, required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(
            top: AppSizes.sH16,
            bottom: AppSizes.sH16,
            right: AppSizes.sW16,
            left: AppSizes.sW16),
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.black26,
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, -3),
          )
        ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomElevatedButton(
              onPressed: () {
                Go.push(BookAppointmentScreen(id: id));
              },
              text: LocaleKeys.bookAppointmentNow.tr(),
            ),
            SizedBox(
              height: AppSizes.sH12,
            ),
            CustomOutlinedButton(
              onPressed: () {
                LauncherHelper.launchWhatsApp(phone);
              },
              text: LocaleKeys.contactOwner.tr(),
            )
          ],
        ));
  }
}
