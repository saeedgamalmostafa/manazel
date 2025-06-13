part of '../../profile_imports.dart';
class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          MoreItem(
            imagePath: AppAssets.svg.user.path,
            title: "محمد السعيد",
            TextColor: AppColors.TextBold,
          ),
          MoreItem(
            imagePath: AppAssets.svg.mail02.path,
            title: "mohamedelsaeed271@gmail.com",
            TextColor: AppColors.TextBold,
          ),
          MoreItem(
            imagePath: AppAssets.svg.smartPhone03.path,
            title: "+201024500957",
            TextColor: AppColors.TextBold,
          ),
        ],
      ),
    );
  }
}
