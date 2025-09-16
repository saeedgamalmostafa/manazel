part of '../../settings_imports.dart';

class DeleteAccountBottomSheet {
  static void show(BuildContext context, SettingsCubit cubit) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      backgroundColor: AppColors.white,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Column(
            spacing: 16.sp,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon in card
              Image.asset(
                'assets/gif/cancel_account.gif',
              ),

              Column(
                spacing: 4.sp,
                children: [
                  CustomText.titleLarge(
                    LocaleKeys.doWantToDeleteAccount.tr(),
                    textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold, color: AppColors.Text),
                  ),
                  CustomText.titleMedium(
                    LocaleKeys.moneyInWalletYouWillLose.tr(),
                    textStyle: Theme.of(context)
                        .textTheme
                        .titleMedium
                        ?.copyWith(color: AppColors.SubText),
                  ),
                ],
              ),

              // Buttons Row
              Row(
                children: [
                  Expanded(
                      child: CustomOutlinedButton(
                          textStyle:
                              const TextStyle(color: AppColors.cancelAccount),
                          color: AppColors.cancelAccount,
                          width: AppSizes.sW160,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          text: LocaleKeys.retreat.tr())),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Center(
                      child: LoadingButton(
                          height: 52.h,
                          color: AppColors.cancelAccount,
                          width: AppSizes.sW160,
                          onTap: () async {
                            await cubit.deleteAccount();
                          },
                          title: LocaleKeys.delete.tr()),
                    ),
                  )
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
