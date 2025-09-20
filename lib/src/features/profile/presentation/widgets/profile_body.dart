part of '../../profile_imports.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    final user = UserCubit.instance.user;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        spacing: AppSizes.sH16,
        children: [
          CustomMoreItem(
            suffixWidget: const SizedBox.shrink(),
            imagePath: AppAssets.svg.user.path,
            title: user.name ?? '',
          ),
          if (user.email != null && user.email!.isNotEmpty)
            CustomMoreItem(
              suffixWidget: const SizedBox.shrink(),
              imagePath: AppAssets.svg.mail02.path,
              title: user.email ?? '',
            ),
          CustomMoreItem(
            suffixWidget: const SizedBox.shrink(),
            imagePath: AppAssets.svg.smartPhone03.path,
            title: user.mobile ?? '',
          ),
        ],
      ),
    );
  }
}
