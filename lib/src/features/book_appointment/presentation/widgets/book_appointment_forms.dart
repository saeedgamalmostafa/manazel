part of '../../book_appointment_imports.dart';

class BookAppointmentForms extends StatefulWidget {
  BookAppointmentForms({super.key});

  @override
  State<BookAppointmentForms> createState() => _BookAppointmentFormsState();
}

class _BookAppointmentFormsState extends State<BookAppointmentForms> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller_name = TextEditingController();
  final TextEditingController _controller_number = TextEditingController();

  @override
  Widget build(BuildContext context) {
    _controller_name.text = "محمد السعيد";
    _controller_number.text = "797982972";

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(LocaleKeys.name.tr(),
              textStyle: TextStyle(
                fontSize: FontSize.s14,
                color: AppColors.primary,
              )),
          SizedBox(
            height: AppSizes.sH6,
          ),
          Container(
            height: AppSizes.sH48,
            child: CustomTextFormField(
              readOnly: true,
              controller: _controller_name,
              style:
                  TextStyle(fontSize: FontSize.s12, color: AppColors.primary),
            ),
          ),
          SizedBox(
            height: AppSizes.sH14,
          ),
          CustomText(LocaleKeys.phoneNumber.tr(),
              textStyle: TextStyle(
                fontSize: FontSize.s14,
                color: AppColors.primary,
              )),
          SizedBox(
            height: AppSizes.sH6,
          ),
          Container(
            height: AppSizes.sH48,
            child: CustomTextFormField(
              readOnly: true,
              controller: _controller_number,
              style:
                  TextStyle(fontSize: FontSize.s12, color: AppColors.primary),
            ),
          ),
          SizedBox(
            height: AppSizes.sH14,
          ),
          CustomText(LocaleKeys.appointments_available.tr(),
              textStyle: TextStyle(
                fontSize: FontSize.s14,
                color: AppColors.Text,
              )),
          SizedBox(
            height: AppSizes.sH6,
          ),
          SizedBox(
            height: AppSizes.sH48,
            child: TextField(
              style:
                  TextStyle(color: AppColors.primary, fontSize: FontSize.s12),
              controller: _controller,
              readOnly: true,
              onTap:  () async {
                await showModalBottomSheet(
                  context: context,
                  builder: (context) => BookAppointmentBottomSheet(
                    onSelected: (value) {
                      setState(() {
                        _controller.text = value;
                      });
                    },
                  ),
                );
              },
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.keyboard_arrow_down),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
