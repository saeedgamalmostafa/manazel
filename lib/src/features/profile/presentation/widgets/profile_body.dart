part of '../../profile_imports.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        spacing: AppSizes.sH16,
        children: [
          CustomMoreItem(
            imagePath: AppAssets.svg.user.path,
            title: "محمد السعيد",
          ),
          CustomMoreItem(
            imagePath: AppAssets.svg.mail02.path,
            title: "mohamedelsaeed271@gmail.com",
          ),
          CustomMoreItem(
            imagePath: AppAssets.svg.smartPhone03.path,
            title: "+201024500957",
          ),
        ],
      ),
    );
  }
}
