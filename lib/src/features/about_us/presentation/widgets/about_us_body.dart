part of '../../about_us_imports.dart';

class AboutUsBody extends StatelessWidget {
  const AboutUsBody({super.key});

  final String arabicText =
      'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة. لقد تم توليد هذا النص من مولد النص العربى، '
      'حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق. '
      'إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، '
      'النص لن يبدو مقسما ولا يحوي أخطاء لغوية، هذا النص يمكن أن يتم تركيبه على أي تصميم دون مشكلة.'
      'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة. لقد تم توليد هذا النص من مولد النص العربى، '
      'إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، '
      'إذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، '
      'النص لن يبدو مقسما ولا يحوي أخطاء لغوية، هذا النص يمكن أن يتم تركيبه على أي تصميم دون مشكلة.'
  ;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 40, left: 16.0, right: 16),
        child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppColors.borderColor,
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            //padding: EdgeInsets.all(15),
            constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.7,
            ),
            child: Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(
                    top: 0, bottom: 28,),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 86, right: 46.5, left: 46.5, bottom: 38),
                      child: Image.asset(
                          AppAssets.png.manazelPrimaryLogoName.path),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 38.0, bottom: 28, left: 18, right: 18),
                      child: AutoSizeText(
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
                    ),
                  ],
                ),
              ),
            )));
  }
}
