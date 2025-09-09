part of '../../otp_imports.dart';

class OtpBody extends StatelessWidget {
  const OtpBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OtpCubit>();
    context.locale;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: AppSizes.sH65, bottom: AppSizes.sH50),
          child: Image.asset(AppAssets.png.manazelWhiteLogoName.path),
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(AppRadius.bR50),
                    topRight: Radius.circular(AppRadius.bR50))),
            child: SingleChildScrollView(
              child: Column(
                spacing: 10.sp,
                children: [
                  AuthTitledHeader(
                      title: LocaleKeys.verificationCode,
                      description: LocaleKeys
                          .pleaseEnterTheVerificationCodeSentToYourMobilePhone),
                  const OtpForms(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      spacing: 5.sp,
                      children: [
                        Text(
                          LocaleKeys.didntReceiveTheVerificationCode,
                          style: const TextStyle().setGreyColor.s12,
                        ),
                        ResendCode(onResendCode: () {
                          cubit.resendCode();
                        })
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        BottomButton(onTap: () async {
          await cubit.verifyOtp();
        })
      ],
    );
  }
}

class ResendCode extends StatefulWidget {
  const ResendCode({super.key, required this.onResendCode});
  final VoidCallback onResendCode;

  @override
  State<ResendCode> createState() => _ResendCodeState();
}

class _ResendCodeState extends State<ResendCode> {
  ValueNotifier<Duration> durationNotifier =
      ValueNotifier(const Duration(seconds: 60));

  // ValueNotifier(const Duration(seconds: kDebugMode ? 5 : 60));
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (durationNotifier.value != Duration.zero) {
        durationNotifier.value =
            Duration(seconds: durationNotifier.value.inSeconds - 1);
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Duration>(
      valueListenable: durationNotifier,
      builder: (context, duration, child) {
        final seconds = duration.inSeconds;

        return Row(
          spacing: 5.sp,
          children: [
            UnderLineTextWidget(
              text: LocaleKeys.resend,
              color: seconds == 0 ? AppColors.primary : AppColors.grey,
            ).withGestureDetector(onTap: () {
              if (seconds != 0) return;
              widget.onResendCode();
              durationNotifier.value = const Duration(seconds: 60);
            }),
            Text(
              seconds > 0 ? "$seconds s" : "",
              style: const TextStyle().setPrimaryColor.s12,
            ),
          ],
        );
      },
    );
  }
}
