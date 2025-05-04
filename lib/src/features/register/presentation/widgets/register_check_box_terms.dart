part of '../../register_imports.dart';

class RegisterCheckBoxTerms extends StatefulWidget {
  const RegisterCheckBoxTerms({super.key});

  @override
  State<RegisterCheckBoxTerms> createState() => _RegisterCheckBoxTermsState();
}

class _RegisterCheckBoxTermsState extends State<RegisterCheckBoxTerms> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => isChecked = !isChecked),
        child: Padding(
          padding: const EdgeInsets.only(top:10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.primary),
                  borderRadius: BorderRadius.circular(6),
                  color: isChecked ?AppColors.primary : Colors.white,
                ),
                child: isChecked
                    ? const Icon(
                  Icons.check,
                  size: 10,
                  color:AppColors.white ,
                )
                    : null,
              ),
              const SizedBox(width: 8),
              Flexible(
                child: Wrap(
                  children: [
                    AppText( LocaleKeys.agree.tr(),color: AppColors.whiteblack,
                    fontSize:12 ,),
                    GestureDetector(
                      onTap: () {
                      },
                      child: AppText(
                          LocaleKeys.terms.tr(),
                          color: AppColors.primary,
                          decoration: TextDecoration.underline,
                          fontSize:12
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

    );
  }
}