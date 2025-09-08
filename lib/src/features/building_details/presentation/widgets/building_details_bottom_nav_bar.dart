part of '../../building_details_imports.dart';

class BuildingDetailsBottomNavBar extends StatelessWidget {
  const BuildingDetailsBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            top: AppSizes.sH16,
            bottom: AppSizes.sH16,
            right: AppSizes.sW16,
            left: AppSizes.sW16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomElevatedButton(
              onPressed: () {
                Go.push(BookAppointmentScreen());
              },
              text: LocaleKeys.bookAppointmentNow.tr(),
            ),
            SizedBox(
              height: AppSizes.sH12,
            ),
            CustomOutlinedButton(
              onPressed: () {},
              text: LocaleKeys.contactOwner.tr(),
            )
          ],
        ));
  }
}
