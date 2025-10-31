part of '../../terms_imports.dart';

class TermsBody extends StatelessWidget {
  const TermsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TermsCubit, AsyncState<String>>(
      builder: (context, state) {
        return StatusBuilder(
          data: state,
          onSuccess: (data, context) => SingleChildScrollView(
            child: Column(
              children: [
                const CustomLogo(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: HtmlWidget(
                    textStyle: const TextStyle(fontSize: 16),
                    data,
                  ),
                ),
                SizedBox(
                  height: AppSizes.sH38,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
