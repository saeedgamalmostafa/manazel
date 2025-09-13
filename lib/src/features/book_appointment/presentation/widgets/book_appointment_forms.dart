part of '../../book_appointment_imports.dart';

class BookAppointmentForms extends StatefulWidget {
  const BookAppointmentForms({super.key});

  @override
  State<BookAppointmentForms> createState() => _BookAppointmentFormsState();
}

class _BookAppointmentFormsState extends State<BookAppointmentForms> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controllerName = TextEditingController();
  final TextEditingController _controllerNumber = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final user = UserCubit.instance.user;
  late final String appointmentId;

  @override
  void initState() {
    _controllerName.text = user.name ?? '';
    _controllerNumber.text = user.mobile ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookAppointmentCubit, AsyncState<List<Appointment>>>(
      builder: (context, state) {
        return Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText.titleMedium(
                        LocaleKeys.name.tr(),
                        textStyle:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: AppColors.primary,
                                ),
                      ),
                      SizedBox(
                        height: AppSizes.sH6,
                      ),
                      SizedBox(
                        height: AppSizes.sH48,
                        child: CustomTextFormField(
                          hintText: LocaleKeys.name.tr(),
                          validator: (v) => Validators.validateEmpty(v),
                          controller: _controllerName,
                          style: TextStyle(
                              fontSize: FontSize.s12, color: AppColors.primary),
                        ),
                      ),
                      SizedBox(
                        height: AppSizes.sH14,
                      ),
                      CustomText.titleMedium(LocaleKeys.phoneNumber.tr(),
                          textStyle:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: AppColors.primary,
                                  )),
                      SizedBox(
                        height: AppSizes.sH6,
                      ),
                      SizedBox(
                        height: AppSizes.sH48,
                        child: CustomTextFormField(
                          textInputType: TextInputType.phone,
                          hintText: LocaleKeys.phoneNumber.tr(),
                          validator: (v) => Validators.validateEmpty(v),
                          controller: _controllerNumber,
                          style: TextStyle(
                              fontSize: FontSize.s12, color: AppColors.primary),
                        ),
                      ),
                      SizedBox(
                        height: AppSizes.sH14,
                      ),
                      CustomText.titleMedium(
                          LocaleKeys.appointmentsAvailable.tr(),
                          textStyle:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: AppColors.Text,
                                  )),
                      SizedBox(
                        height: AppSizes.sH6,
                      ),
                      SizedBox(
                        height: AppSizes.sH48,
                        child: TextFormField(
                          validator: (v) => Validators.validateEmpty(v),
                          style: TextStyle(
                              color: AppColors.primary, fontSize: FontSize.s12),
                          controller: _controller,
                          readOnly: true,
                          onTap: () async {
                            await showModalBottomSheet(
                              context: context,
                              builder: (context) => BookAppointmentBottomSheet(
                                appointments: state.data,
                                onSelected: (value) {
                                  setState(() {
                                    appointmentId = value.id.toString();
                                    _controller.text = value.dateTimeFormatted;
                                  });
                                },
                              ),
                            );
                          },
                          decoration: const InputDecoration(
                            hint: Text(
                              'اختر موعدد المعاينه',
                              style: TextStyle(color: AppColors.grey),
                            ),
                            suffixIcon: Icon(Icons.keyboard_arrow_down),
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(
                      top: AppSizes.sH16,
                      bottom: AppSizes.sH16,
                      right: AppSizes.sW16,
                      left: AppSizes.sW16),
                  decoration:
                      const BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      spreadRadius: 0,
                      blurRadius: 10,
                      offset: Offset(0, -3),
                    )
                  ]),
                  child: Center(
                    child: LoadingButton(
                        title: LocaleKeys.send,
                        onTap: () async {
                          if (!_formKey.currentState!.validate()) return;
                          await context
                              .read<BookAppointmentCubit>()
                              .bookAppointment(
                                name: _controllerName.text,
                                phone: _controllerNumber.text,
                                appointment: appointmentId,
                              );
                        }),
                  ))
            ],
          ),
        );
      },
    );
  }
}
