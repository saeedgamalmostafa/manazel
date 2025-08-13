part of '../../building_details_imports.dart';

class BuildingDetailsText extends StatelessWidget {
  const BuildingDetailsText({super.key});

  final String arabicText =
      'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة. لقد تم توليد هذا النص من مولد النص العربى، '
      'حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق. '
      'إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، '
      'النص لن يبدو مقسما ولا يحوي أخطاء لغوية، هذا النص يمكن أن يتم تركيبه على أي تصميم دون مشكلة.'
      'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة. لقد تم توليد هذا النص من مولد النص العربى، '
      'إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، '
      'إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، '
      'النص لن يبدو مقسما ولا يحوي أخطاء لغوية، هذا النص يمكن أن يتم تركيبه على أي تصميم دون مشكلة.';
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
            vertical: AppSizes.sH16, horizontal: AppSizes.sW16),
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            color: AppColors.white,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppAssets.svg.details.path,
                          width: AppSizes.sW20,
                          height: AppSizes.sH20,
                        ),
                        SizedBox(width: AppSizes.sW5),
                        CustomText.titleMedium(
                          LocaleKeys.building_details_title.tr(),
                          textStyle:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: AppColors.primary,
                                  ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSizes.sH4),
                    AutoSizeText(
                      arabicText,
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.8,
                        color: AppColors.Text,
                      ),
                      textAlign: TextAlign.justify,
                      maxLines: 300,
                      minFontSize: 12,
                      overflow: TextOverflow.ellipsis,
                      wrapWords: false,
                    ),
                  ],
                ),
              ),
            )));
  }
}
