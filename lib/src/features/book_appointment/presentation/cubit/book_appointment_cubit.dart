import 'package:manazel/src/core/helpers/toast.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/base_domain_imports.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/presentation/cubit/base_cubit/async_cubit.dart';
import 'package:manazel/src/core/widgets/default_bottom_sheet.dart';
import 'package:manazel/src/features/book_appointment/book_appointment_imports.dart';

class BookAppointmentCubit extends AsyncCubit<List<Appointment>> {
  final int? propertyId;

  BookAppointmentCubit({this.propertyId}) : super([]) {
    getAppointments(); // auto-fetch on creation
  }

  Future<void> getAppointments() async {
    setLoading();
    final result = await baseCrudUseCase<List<Appointment>>(
      CrudBaseParams(
        api: '/api/v1/property/$propertyId/appointments',
        httpRequestType: HttpRequestType.get,
        mapper: (value) {
          return (value['appointments'] as List)
              .map((e) => Appointment.fromJson(e))
              .toList();
        },
      ),
    );

    result.when(
      (response) => setSuccess(data: response.data!),
      (error) => setError(errorMessage: error.message),
    );
  }

  Future<void> bookAppointment(
      {required String name,
      required String phone,
      required String appointment}) async {
    setLoading();
    final result = await baseCrudUseCase(
      CrudBaseParams(
        api: '/api/v1/property/$propertyId/client/reservation',
        httpRequestType: HttpRequestType.post,
        body: {'name': name, 'mobile': phone, 'appointment': appointment},
        mapper: (value) {},
      ),
    );

    result.when(
      (response) {
        showDefaultBottomSheet(
            isDismissible: false, child: const BookDoneBottomSheet());
      },
      (error) {
        showErrorToast(error.message);
      },
    );
  }
}

class Appointment {
  final int id;
  final int propertyId;
  final String date;
  final String time;
  final String dateTimeFormatted;

  Appointment({
    required this.id,
    required this.propertyId,
    required this.date,
    required this.time,
    required this.dateTimeFormatted,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['id'] is int
          ? json['id']
          : int.tryParse(json['id'].toString()) ?? 0,
      propertyId: json['property_id'] is int
          ? json['property_id']
          : int.tryParse(json['property_id'].toString()) ?? 0,
      date: json['date']?.toString() ?? '',
      time: json['time']?.toString() ?? '',
      dateTimeFormatted: json['date_time_formated']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'property_id': propertyId,
      'date': date,
      'time': time,
      'date_time_formated': dateTimeFormatted,
    };
  }
}
