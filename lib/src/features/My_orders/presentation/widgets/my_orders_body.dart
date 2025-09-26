part of '../../my_orders_imports.dart';

class MyOrdersBody extends StatefulWidget {
  const MyOrdersBody({super.key});

  @override
  State<MyOrdersBody> createState() => _MyOrdersBodyState();
}

class _MyOrdersBodyState extends State<MyOrdersBody> {
  late final ScrollController _scrollController;
  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<ReservationCubit>().getReservatons();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReservationCubit,
        AsyncState<BaseModel<List<ReservationModel>>?>>(
      builder: (context, state) {
        return StatusBuilder(
            data: state,
            onSuccess: (data, context) {
              if (state.data!.data!.isEmpty) {
                return const NotContainData();
              }
              return RefreshIndicator(
                color: AppColors.primary,
                onRefresh: () async {
                  context
                      .read<ReservationCubit>()
                      .getReservatons(isFirst: true);
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
                      final model = data.data![index];
                      return MyOrdersItemCard(
                        orderImage: model.property.images!.isNotEmpty
                            ? model.property.images!.first
                            : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRE_MdEx5jqXS1AXGmgOxY_PJh7LF5ng2MMsE8PDceRgt_WSM7IxmS3HiIM0qz4F8QPD1o&usqp=CAU',
                        title: model.property.title,
                        profileName: model.name,
                        calendar: model.appointment.dateTimeFormatted,
                        rate: model.property.rate,
                      );
                    }),
              );
            });
      },
    );
  }
}
