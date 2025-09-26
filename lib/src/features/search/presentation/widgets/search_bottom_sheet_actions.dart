part of '../../search_imports.dart';

class SearchBottomSheetType extends StatefulWidget {
  const SearchBottomSheetType({
    super.key,
    required this.types,
    this.onChanged,
  });

  final List<DropDownItem> types;
  final ValueChanged<int>? onChanged;

  @override
  State<SearchBottomSheetType> createState() => _SearchBottomSheetTypeState();
}

class _SearchBottomSheetTypeState extends State<SearchBottomSheetType> {
  int? selectedId;

  @override
  void initState() {
    super.initState();
    if (widget.types.isNotEmpty) {
      selectedId = widget.types.first.id;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onChanged?.call(selectedId!);
      });
    }
  }

  void _select(int id) {
    setState(() => selectedId = id);
    widget.onChanged?.call(id);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.sH46,
      child: Row(
        spacing: 8.sp,
        children: widget.types.map((type) {
          final isSelected = selectedId == type.id;
          return Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                right: type == widget.types.first ? 0 : AppSizes.sW11,
              ),
              child: SearchOutlinedButton(
                isSelected: isSelected,
                onTap: () => _select(type.id),
                text: type.name,
                color: AppColors.Text,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
