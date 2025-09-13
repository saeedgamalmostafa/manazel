part of '../../app_layout_imports.dart';

class AppLayoutTabs extends StatelessWidget {
  const AppLayoutTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSizes.sH74,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 0,
              blurRadius: 10,
              offset: const Offset(0, -3),
            ),
          ],
          color: AppColors.white,
          border: const Border(top: BorderSide(color: AppColors.white))),
      alignment: Alignment.bottomCenter,
      child: BlocBuilder<AppLayoutCubit, AppLayoutState>(
        builder: (context, state) {
          return TabBar(
            controller: state.controller,
            onTap: (index) => context.read<AppLayoutCubit>().changeIndex(index),
            physics: const NeverScrollableScrollPhysics(),
            dividerColor: Colors.transparent,
            indicator: const TopIndicator(
              color: AppColors.primary,
              radius: 2,
            ),
            labelColor: AppColors.primary,
            unselectedLabelColor: AppColors.grey,
            tabs: [
              CustomTabItem(
                title: LocaleKeys.home.tr(),
                imagePath: AppAssets.svg.icon.path,
                isSelected: state.index == 0,
              ),
              CustomTabItem(
                title: LocaleKeys.favorite.tr(),
                imagePath: AppAssets.svg.favourite.path,
                isSelected: state.index == 1,
              ),
              CustomTabItem(
                title: LocaleKeys.rate.tr(),
                imagePath: AppAssets.svg.chatBot.path,
                isSelected: state.index == 2,
              ),
              CustomTabItem(
                title: LocaleKeys.more.tr(),
                imagePath: AppAssets.svg.elements.path,
                isSelected: state.index == 3,
              ),
            ],
          );
        },
      ),
    );
  }
}

class TopIndicator extends Decoration {
  final Color color;
  final double thickness;
  final double radius;

  const TopIndicator({
    required this.color,
    this.thickness = 2,
    this.radius = 0,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _TopIndicatorPainter(color, thickness, radius);
  }
}

class _TopIndicatorPainter extends BoxPainter {
  final Color color;
  final double thickness;
  final double radius;

  _TopIndicatorPainter(this.color, this.thickness, this.radius);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration config) {
    final Rect rect =
        Offset(offset.dx, offset.dy) & Size(config.size!.width, thickness);

    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final RRect rrect = RRect.fromRectAndCorners(
      rect,
      topLeft: Radius.circular(radius),
      topRight: Radius.circular(radius),
    );

    canvas.drawRRect(rrect, paint);
  }
}
