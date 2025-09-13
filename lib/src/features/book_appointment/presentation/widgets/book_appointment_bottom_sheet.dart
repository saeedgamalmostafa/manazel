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
  Widget build(BuildContext context) {
    if (widget.appointments.isEmpty) {
      return SizedBox(
        height: AppSizes.sH200,
        child: Center(
          child: CustomText.titleLarge(
            "لا توجد مواعيد متاحة", // or LocaleKeys.noAppointments.tr()
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

              // ✅ Build radios from appointments
              ...widget.appointments.map((appointment) {
                return BookAppointmentRadioListTile<Appointment?>(
                  value: appointment,
                  groupValue: tempSelected,
                  title: appointment.dateTimeFormatted,
                  activeColor: Theme.of(context).primaryColor,
                  onChanged: (value) {
                    setState(() {
                      tempSelected = value;
                    });
                  },
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
