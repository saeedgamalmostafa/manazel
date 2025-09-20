part of '../imports/presentaion_imports.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, AsyncState<HomeModel?>>(
      builder: (context, state) {
        return StatusBuilder(
            shamierWidget: const HomeShimmer(),
            data: state,
            onSuccess: (data, context) {
              return RefreshIndicator.adaptive(
                color: AppColors.primary,
                onRefresh: () async {
                  context.read<HomeCubit>().fetchHome();
                },
                child: SingleChildScrollView(
                  child: Column(children: [
                    CustomImageSlider(advertisement: data!.advertisements),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          HomeActions(
                            onTabChanged: (index) {
                              setState(() {
                                _selected = index;
                              });
                            },
                          ),
                          HomeItemsCard(
                              properties: data.properties, tabIndex: _selected),
                        ],
                      ),
                    ),
                  ]),
                ),
              );
            });
      },
    );
  }
}

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // 🔹 Slider shimmer
          Padding(
            padding: EdgeInsets.only(
              top: AppSizes.sH20,
              left: AppSizes.sW12,
              right: AppSizes.sW12,
            ),
            child: CustomShimmer(
              width: AppSizes.sW323,
              height: AppSizes.sH125,
              borderRadius: BorderRadius.circular(16),
              margin: 0,
            ),
          ),

          SizedBox(height: AppSizes.sH20),

          // 🔹 Tabs shimmer (pill shape)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.sW16),
            child: Row(
              children: [
                Expanded(
                  child: CustomShimmer(
                    height: 40,
                    borderRadius: BorderRadius.circular(50),
                    margin: 0,
                  ),
                ),
                SizedBox(width: AppSizes.sW10),
                Expanded(
                  child: CustomShimmer(
                    height: 40,
                    borderRadius: BorderRadius.circular(50),
                    margin: 0,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: AppSizes.sH20),

          // 🔹 Items list shimmer
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5, // number of skeleton cards
            separatorBuilder: (_, __) => SizedBox(height: AppSizes.sH12),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.sW12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // image placeholder
                    CustomShimmer(
                      width: 100,
                      height: 100,
                      borderRadius: BorderRadius.circular(12),
                      margin: 0,
                    ),
                    SizedBox(width: AppSizes.sW12),

                    // text placeholders
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomShimmer(height: 16, width: 150, margin: 0),
                          SizedBox(height: 8),
                          CustomShimmer(height: 14, width: 200, margin: 0),
                          SizedBox(height: 8),
                          CustomShimmer(height: 14, width: 100, margin: 0),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
