part of '../../book_appointment_imports.dart';

class BookAppointmentBottomSheet extends StatefulWidget {
  final Appointment? selectedValue;
  final ValueChanged<Appointment> onSelected;
  final List<Appointment> appointments;
  const BookAppointmentBottomSheet({
    super.key,
    this.selectedValue,
    required this.appointments,
    required this.onSelected,
  });

  @override
  State<BookAppointmentBottomSheet> createState() =>
      _BookAppointmentBottomSheetState();
}

class _BookAppointmentBottomSheetState
    extends State<BookAppointmentBottomSheet> {
  Appointment? tempSelected;

  @override
  void initState() {
    super.initState();
    tempSelected = widget.selectedValue;
  }

  @override
  void didUpdateWidget(covariant BookAppointmentBottomSheet oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedValue != widget.selectedValue) {
      tempSelected = widget.selectedValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.appointments.isEmpty) {
      return SizedBox(
        height: AppSizes.sH200,
        child: Center(
          child: CustomText.titleLarge(
            "لا توجد مواعيد متاحة",
            textStyle: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: AppColors.grey),
          ),
        ),
      );
    }

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppSizes.sH18),
        child: SizedBox(
          height: AppSizes.sH344,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomText.titleLarge(
                LocaleKeys.chooseAppointmentExamination,
                textStyle: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: AppColors.buttonColor),
              ),
              SizedBox(height: AppSizes.sH18),
              ...widget.appointments.map((appointment) {
                return KeyedSubtree(
                  key: ValueKey(appointment.id),
                  child: BookAppointmentRadioListTile<Appointment>(
                    value: appointment,
                    groupValue: tempSelected,
                    title: appointment.dateTimeFormatted,
                    onChanged: (value) {
                      setState(() {
                        tempSelected = value;
                      });
                    },
                  ),
                );
              }),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSizes.sW16),
                child: CustomElevatedButton(
                  onPressed: () {
                    if (tempSelected != null) {
                      widget.onSelected(tempSelected!);
                      Go.pop();
                    }
                  },
                  text: LocaleKeys.sure.tr(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
