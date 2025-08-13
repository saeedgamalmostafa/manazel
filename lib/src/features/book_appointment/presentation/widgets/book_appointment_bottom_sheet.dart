part of '../../book_appointment_imports.dart';

class BookAppointmentBottomSheet extends StatefulWidget {
  final String? selectedValue;
  final ValueChanged<String> onSelected;

  const BookAppointmentBottomSheet(
      {Key? key, this.selectedValue, required this.onSelected})
      : super(key: key);

  @override
  State<BookAppointmentBottomSheet> createState() =>
      _BookAppointmentBottomSheet();
}

class _BookAppointmentBottomSheet extends State<BookAppointmentBottomSheet> {
  String? tempSelected;

  final List<String> options = [
    'السبت - 7:30 مساءا',
    'الأحد - 9:30 مساءا',
    'الأربعاء - 10:00 مساءا',
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppSizes.sH18),
        child: Container(
          height: AppSizes.sH344,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText.titleLarge(
                LocaleKeys.choose_appointment_examination,
                textStyle: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: AppColors.buttonColor),
              ),
              SizedBox(height: AppSizes.sH18),
              ...options.map((option) => BookAppointmentRadioListTile<String>(
                    value: option,
                    groupValue: tempSelected ?? '',
                    title: option,
                    activeColor: Theme.of(context).primaryColor,
                    onChanged: (value) {
                      setState(() {
                        tempSelected = value;
                      });
                    },
                  )),
              SizedBox(height: AppSizes.sH26),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.sW16),
                child: CustomElevatedButton(
                  onPressed: () {
                    widget.onSelected(tempSelected!);
                    Go.pop();
                  },
                  text: LocaleKeys.sure.tr(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
