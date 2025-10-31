part of '../../notifications_imports.dart';

class NotificationsBody extends StatefulWidget {
  const NotificationsBody({super.key});

  @override
  State<NotificationsBody> createState() => _NotificationsBodyState();
}

class _NotificationsBodyState extends State<NotificationsBody> {
  late final ScrollController _scrollController;
  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<NotificationsCubit>().getNotifications();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit,
        AsyncState<BaseModel<List<NotificationModel>>?>>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: StatusBuilder(
                  shamierWidget: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (_, __) =>
                        const NotificationsItemCardShimmer(),
                  ),
                  data: state,
                  onSuccess: (data, context) {
                    if (state.data!.data!.isEmpty) {
                      return const NotContainData();
                    }
                    return RefreshIndicator(
                      color: AppColors.primary,
                      onRefresh: () async {
                        context
                            .read<NotificationsCubit>()
                            .getNotifications(isFirst: true);
                      },
                      child: ListView.builder(
                          padding: EdgeInsets.only(bottom: AppSizes.sH20),
                          controller: _scrollController,
                          itemCount: data!.data!.length + 1,
                          itemBuilder: (BuildContext context, int index) {
                            if (index == data.data!.length) {
                              if (state.isLoadingMore) {
                                return CustomLoading.showLoadingView();
                              } else {
                                return const SizedBox.shrink();
                              }
                            }
                            return NotificationsItemCard(
                                model: data.data![index]);
                          }),
                    );
                  }),
            ),
            if (state.data!.data!.isNotEmpty && state.data!.data!.length != 1)
              GestureDetector(
                onTap: () =>
                    context.read<NotificationsCubit>().deleteNotification(null),
                child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: AppSizes.sH40,
                    ),
                    child: SvgPicture.asset(
                      AppAssets.svg.cancelButton.path,
                      height: AppSizes.sH65,
                      width: AppSizes.sW65,
                    )),
              )
          ],
        );
      },
    );
  }
}

class NotificationsItemCardShimmer extends StatelessWidget {
  const NotificationsItemCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: AppSizes.sH8,
        horizontal: AppSizes.sW8,
      ),
      child: SizedBox(
        height: AppSizes.sH62,
        width: AppSizes.sW343,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: AppColors.white,
          child: Row(
            children: [
              // Icon shimmer (circle)
              Padding(
                padding: EdgeInsets.only(
                  right: AppSizes.sW8,
                  top: AppSizes.sH9,
                  bottom: AppSizes.sH9,
                ),
                child: CustomShimmer(
                  height: AppSizes.sH44,
                  width: AppSizes.sW44,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),

              // Text shimmer
              Expanded(
                child: CustomShimmer(
                  height: AppSizes.sH14,
                  width: double.infinity,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),

              SizedBox(width: AppSizes.sW30),

              // Cancel icon shimmer (small circle)
              Padding(
                padding: EdgeInsets.only(
                  left: AppSizes.sW12,
                  top: AppSizes.sH21,
                  bottom: AppSizes.sH21,
                ),
                child: CustomShimmer(
                  height: AppSizes.sH20,
                  width: AppSizes.sW20,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
