part of '../../more_imports.dart';

class LogoutBottomSheet {
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
                  'assets/gif/log_out.gif',
                  width: 120,
                  height: 120,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 28),
              CustomText(LocaleKeys.do_you_want_logout.tr(),
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                  )),

              const SizedBox(height: 32),

              // Buttons Row
              SizedBox(
                height: AppSizes.sH50,
                child: Row(
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                          width: 163.5,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          text: LocaleKeys.yes.tr()),
                    ),

                    const SizedBox(width: 16),
                    // No Button
                    Expanded(
                        child: CustomOutlinedButton(
                            width: 163.5,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            text: LocaleKeys.no.tr())),
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
