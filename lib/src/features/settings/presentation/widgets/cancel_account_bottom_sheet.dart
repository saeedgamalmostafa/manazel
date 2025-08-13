part of '../../settings_imports.dart';

class CancelAccountBottomSheet {
  static void show(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
      ),
      backgroundColor: AppColors.white,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon in card
              Container(
                child: Image.asset(
                  'assets/gif/cancel_account.gif',
                  width: 120,
                  height: 120,
                  fit: BoxFit.contain,
                ),
              ),

              SizedBox(height: AppSizes.sH16),
              CustomText.titleLarge(
                LocaleKeys.doWantToDeleteAccount.tr(),
                textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold, color: AppColors.Text),
              ),
              SizedBox(
                height: AppSizes.sH6,
              ),
              CustomText.titleMedium(
                LocaleKeys.moneyInWalletYouWillLose.tr(),
                textStyle: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(color: AppColors.SubText),
              ),
              SizedBox(height: AppSizes.sH32),

              // Buttons Row
              SizedBox(
                height: AppSizes.sH50,
                child: Row(
                  children: [
                    Expanded(
                        child: CustomOutlinedButton(
                            textStyle:
                                TextStyle(color: AppColors.cancelAccount),
                            color: AppColors.cancelAccount,
                            width: AppSizes.sW160,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            text: LocaleKeys.retreat.tr())),
                    const SizedBox(width: 16),
                    Expanded(
                      child: CustomElevatedButton(
                          backgroundColor: AppColors.cancelAccount,
                          color: AppColors.cancelAccount,
                          width: AppSizes.sW160,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          text: LocaleKeys.delete.tr()),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
}
