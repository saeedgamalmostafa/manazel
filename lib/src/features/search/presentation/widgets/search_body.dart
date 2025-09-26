part of '../../search_imports.dart';

class SearchBody extends StatefulWidget {
  const SearchBody({super.key});

  @override
  State<SearchBody> createState() => _SearchBodyState();
}

class _SearchBodyState extends State<SearchBody> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSizes.sH16),
      child: Column(
        spacing: 6.sp,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSizes.sW16),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: AppSizes.sH48,
                    child: CustomTextFormField(
                      hintText: 'ابحث عن عقار',
                      fillColor: Colors.white,
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.sW12, vertical: AppSizes.sH15),
                        child: SvgPicture.asset(
                          AppAssets.svg.searchGray.path,
                          height: AppSizes.sH18,
                          width: AppSizes.sW18,
                        ),
                      ),
                      onChanged: (value) {
                        if (_debounce?.isActive ?? false) _debounce!.cancel();
                        _debounce = Timer(const Duration(seconds: 1), () {
                          if (context.mounted) {
                            context.read<FilterCubit>().getPropertyByFilter(
                                  newParams: FilterParams(search: value),
                                  isFirst: true,
                                );
                          }
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: AppSizes.sW14,
                ),
                InkWell(
                  onTap: () async {
                    final result =
                        await showModalBottomSheet<Map<String, dynamic>>(
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30.r)),
                      ),
                      builder: (context) {
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: BlocProvider(
                            create: (context) =>
                                FilterDataCubit()..getFilterData(),
                            child: const FilterSearchBottomSheet(),
                          ),
                        );
                      },
                    );

                    if (result != null) {
                      if (context.mounted) {
                        context.read<FilterCubit>().getPropertyByFilter(
                              newParams: FilterParams(
                                purpose: result["purposeId"],
                                type: result["typeId"],
                                cityId: result["cityId"],
                                priceMin: result["minPrice"],
                                priceMax: result["maxPrice"],
                              ),
                              isFirst: true,
                            );
                      }
                      print("Selected filters: $result");
                    }
                  },
                  child: SvgPicture.asset(
                    height: AppSizes.sH48,
                    width: AppSizes.sW48,
                    AppAssets.svg.filter.path,
                  ),
                ),
              ],
            ),
          ),
          // 🔹 Property list
          const Expanded(child: PropertyList())
        ],
      ),
    );
  }
}

class PropertyList extends StatefulWidget {
  const PropertyList({super.key});

  @override
  State<PropertyList> createState() => _PropertyListState();
}

class _PropertyListState extends State<PropertyList> {
  late final ScrollController _scrollController;
  @override
  void initState() {
    super.initState();

    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        context.read<FilterCubit>().getPropertyByFilter();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterCubit, AsyncState<BaseModel<List<PropertyItem>>?>>(
      builder: (context, state) {
        return StatusBuilder(
            errorMessage: state.errorMessage,
            shamierWidget: ListView.builder(
              itemCount: 5,
              itemBuilder: (_, __) => const CustomItemCardShimmer(),
            ),
            data: state,
            onSuccess: (data, context) {
              if (state.data!.data!.isEmpty) {
                return const NotContainData();
              }
              return ListView.builder(
                itemCount: data!.data!.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == data.data?.length) {
                    if (state.isLoadingMore) {
                      return CustomLoading.showLoadingView();
                    } else {
                      return const SizedBox.shrink();
                    }
                  }
                  return BlocProvider(
                    create: (context) => FavCubit(),
                    child: CustomItemCard(
                      propertyItem: data.data![index],
                      onTap: () => Go.push(PropertyDetailsScreen(
                        id: data.data![index].id,
                      )),
                    ),
                  );
                },
              );
            });
      },
    );
  }
}
