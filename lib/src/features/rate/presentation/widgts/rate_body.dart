part of '../../rate_imports.dart';

class RateBody extends StatelessWidget {
  const RateBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.all(16), child: RateForms());
  }
}
