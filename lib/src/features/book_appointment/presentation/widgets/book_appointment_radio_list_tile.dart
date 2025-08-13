part of '../../book_appointment_imports.dart';

class BookAppointmentRadioListTile<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final String title;
  final ValueChanged<T> onChanged;
  final Color activeColor;

  const BookAppointmentRadioListTile({
    Key? key,
    required this.value,
    required this.groupValue,
    required this.title,
    required this.onChanged,
    this.activeColor = AppColors.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool selected = value == groupValue;

    return Padding(
      padding: EdgeInsets.only(
          right: AppSizes.sW14, left: AppSizes.sW14, bottom: AppSizes.sW14),
      child: Card(
        color: AppColors.radioColor,
        child: ListTile(
          leading: Container(
            width: AppSizes.sW18,
            height: AppSizes.sH18,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: selected ? activeColor : AppColors.grey,
                width: 2,
              ),
              color: selected ? activeColor : Colors.transparent,
            ),
            child: selected
                ? const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 16,
                  )
                : null,
          ),
          title: Text(title),
          onTap: () => onChanged(value),
        ),
      ),
    );
  }
}
