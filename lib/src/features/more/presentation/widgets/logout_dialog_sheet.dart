part of '../../more_imports.dart';

class LogOutWidget extends StatelessWidget {
  const LogOutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Icon in card
        AppAssets.lottie.logout.lottie(height: 250.h),
        CustomText(LocaleKeys.doYouWantToLogout,
            textStyle: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            )),

        const SizedBox(height: 32),

        // Buttons Row
        Row(
          children: [
            Expanded(
              child: Center(
                child: LoadingButton(
                    onTap: () async {
                      await context.read<MoreCubit>().logOut();
                    },
                    title: LocaleKeys.yes.tr()),
              ),
            ),

            const SizedBox(width: 16),
            // No Button
            Expanded(
                child: CustomOutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: LocaleKeys.no.tr())),
          ],
        ),
      ],
    );
  }
}
