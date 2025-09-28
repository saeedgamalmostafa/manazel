part of '../../search_imports.dart';

class SearchBottomSheetType extends StatefulWidget {
  const SearchBottomSheetType({
    super.key,
    required this.types,
    this.onChanged,
  });

  final List<DropDownItem> types;
  final ValueChanged<String>? onChanged;

  @override
  State<SearchBottomSheetType> createState() => _SearchBottomSheetTypeState();
}

class _SearchBottomSheetTypeState extends State<SearchBottomSheetType> {
  String? selectedType;

  @override
  void initState() {
    super.initState();
    if (widget.types.isNotEmpty) {
      selectedType = widget.types.first.value;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onChanged?.call(selectedType!);
      });
    }
  }

  void _select(String val) {
    setState(() => selectedType = val);
    widget.onChanged?.call(val);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSizes.sH46,
      child: Row(
        spacing: 8.sp,
        children: widget.types.map((type) {
          final isSelected = selectedType == type.id;
          return Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                right: type == widget.types.first ? 0 : AppSizes.sW11,
              ),
              child: SearchOutlinedButton(
                isSelected: isSelected,
                onTap: () => _select(type.value),
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
