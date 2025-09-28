part of '../../book_appointment_imports.dart';

class BookAppointmentRadioListTile<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final String title;
  final ValueChanged<T> onChanged;
  final Color activeColor;

  const BookAppointmentRadioListTile({
    super.key,
    required this.value,
    required this.groupValue,
    required this.title,
    required this.onChanged,
    this.activeColor = AppColors.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    final bool selected = value == groupValue; // works thanks to == override

    return Padding(
      padding: EdgeInsets.only(
          right: AppSizes.sW14, left: AppSizes.sW14, bottom: AppSizes.sW14),
      child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
              color: selected ? activeColor : AppColors.grey, width: 1),
          color: selected
              ? activeColor.withAlpha(20)
              : AppColors.grey.withAlpha(5),
        ),
        child: ListTile(
          leading: Container(
            width: AppSizes.sW18,
            height: AppSizes.sH18,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: selected ? activeColor : AppColors.grey, width: 1),
              color: selected ? activeColor : Colors.transparent,
            ),
            child: selected
                ? const Icon(Icons.check, color: Colors.white, size: 16)
                : null,
          ),
          title: Text(title,
              style: TextStyle(color: selected ? activeColor : Colors.grey)
                  .medium
                  .s14),
          splashColor: activeColor.withAlpha(10),
          onTap: () => onChanged(value),
        ),
      ),
    );
  }
}
