part of '../../search_imports.dart';

class SearchOutlinedButton extends StatefulWidget {
  const SearchOutlinedButton({
    Key? key,
    required this.text,
    this.onTap,
    this.borderRadius,
    this.width,
    this.height,
    required this.color,
  }) : super(key: key);

  final String text;
  final VoidCallback? onTap;
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double? height;
  final Color color;

  @override
  State<SearchOutlinedButton> createState() => _SearchOutlinedButton();
}

class _SearchOutlinedButton extends State<SearchOutlinedButton> {
  bool isSelected = false;

  void _handleTap() {
    setState(() {
      isSelected = !isSelected; // Toggle selection
    });

    if (widget.onTap != null) widget.onTap!();
  }

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: _handleTap,
      style: OutlinedButton.styleFrom(
        fixedSize: Size(widget.width ?? 166, widget.height ?? 46),
        side: BorderSide(
          color: isSelected ? AppColors.buttonColor : AppColors.grey,
          width: 0.6,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
        ),
        backgroundColor: Colors.white,
      ),
      child: CustomText.titleMedium(
        widget.text,
        textStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: widget.color,
            ),
      ),
    );
  }
}
