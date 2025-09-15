part of '../../building_details_imports.dart';

class BuildingDetailsImageSlider extends StatefulWidget {
  final PropertyModel model;
  const BuildingDetailsImageSlider({super.key, required this.model});

  @override
  State<BuildingDetailsImageSlider> createState() =>
      _BuildingDetailsImageSliderState();
}

class _BuildingDetailsImageSliderState
    extends State<BuildingDetailsImageSlider> {
  final List<String> fallbackImages = [
    'https://picsum.photos/id/1015/600/300',
    'https://picsum.photos/id/1016/600/300',
    'https://picsum.photos/id/1018/600/300',
    'https://picsum.photos/id/1015/600/300',
    'https://picsum.photos/id/1016/600/300',
    'https://picsum.photos/id/1018/600/300',
  ];

  late List<String> images;
  int _current = 0;
  late PageController _controller;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    images = (widget.model.images != null && widget.model!.images.isNotEmpty)
        ? widget.model.images
        : fallbackImages;

    _controller = PageController();
    _startAutoPlay();
  }

  void _startAutoPlay() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      if (images.isEmpty) return; // Prevent errors if empty
      if (_current < images.length - 1) {
        _current++;
      } else {
        _current = 0;
      }
      if (mounted) {
        _controller.animateToPage(
          _current,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  Widget _buildIndicator(int index) {
    bool isActive = index == _current;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 3),
      height: 8,
      width: isActive ? 15 : 8,
      decoration: BoxDecoration(
        color: isActive ? AppColors.buttonColor : AppColors.borderColor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (images.isEmpty) {
      // Return placeholder if no images at all
      return const Center(child: Text("No images available"));
    }

    return Column(
      children: [
        SizedBox(
          height: AppSizes.sH338,
          width: AppSizes.sW375,
          child: Stack(
            children: [
              // Sliding Images
              PageView.builder(
                controller: _controller,
                itemCount: images.length,
                onPageChanged: (index) {
                  setState(() => _current = index);
                },
                itemBuilder: (context, index) {
                  return ClipRRect(
                    child: Image.network(
                      images[index],
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      errorBuilder: (context, error, stackTrace) =>
                          const Center(child: Icon(Icons.broken_image)),
                    ),
                  );
                },
              ),

              // Back Button
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 25.h),
                child: Row(
                  children: [
                    const CustomBackButton(),
                    const Spacer(),
                    BlocProvider(
                      create: (context) => FavCubit(),
                      child: BlocBuilder<FavCubit, AsyncState>(
                        builder: (context, state) {
                          final cubit = context.read<FavCubit>();
                          return ValueListenableBuilder(
                              valueListenable: widget.model.isFavourite,
                              builder: (context, value, child) {
                                return CustomCirclurButton(
                                  loadingWidget: cubit.isFavLoading
                                      ? const Center(
                                          child: CupertinoActivityIndicator())
                                      : null,
                                  imagepath: !widget.model.isFavourite.value
                                      ? AppAssets.svg.favoritePrimaryBorder.path
                                      : AppAssets.svg.favoritePrimary.path,
                                  onTap: () {
                                    cubit.toggleFav(widget.model.id.toString());

                                    widget.model.isFavourite.value = !value;
                                  },
                                  height: AppSizes.sH40,
                                  width: AppSizes.sW40,
                                );
                              });
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // Label
              Positioned(
                bottom: 14,
                left: 14,
                child: ChangeContainerBuildingDetails(
                  color: AppColors.containerTextColor1,
                  background_color: AppColors.white,
                  text: widget.model.type,
                ),
              ),
            ],
          ),
        ),

        SizedBox(height: AppSizes.sH12),

        // Dots Indicator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(images.length, (index) {
            return GestureDetector(
              onTap: () {
                _controller.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              },
              child: _buildIndicator(index),
            );
          }),
        )
      ],
    );
  }
}
