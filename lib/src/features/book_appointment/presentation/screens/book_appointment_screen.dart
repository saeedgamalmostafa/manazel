part of '../../book_appointment_imports.dart';

class BookAppointmentScreen extends StatelessWidget {
  final int id;
  const BookAppointmentScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.scaffoldBackground,
        appBar: CustomAppBar(
          title: LocaleKeys.bookInspection.tr(),
          showBackArrow: true,
        ),
        body: BlocProvider(
          create: (context) => BookAppointmentCubit(propertyId: id),
          child:
              BlocBuilder<BookAppointmentCubit, AsyncState<List<Appointment>>>(
            builder: (context, state) {
              return const BookAppointmentBody();
            },
          ),
        ));
  }
}
