import 'package:manazel/src/core/helpers/toast.dart';
import 'package:manazel/src/core/network/api_endpoints.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/base_domain_imports.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/usecases/pagination_response.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/presentation/cubit/base_cubit/async_cubit.dart';

class ReservationCubit extends AsyncCubit<BaseModel<List<ReservationModel>>?> {
  ReservationCubit() : super(null);

  int currentPage = 1;
  bool hasMore = true;
  bool isProcessingRequest = false;

  Future<void> getReservatons({bool isFirst = false}) async {
    if (isProcessingRequest) return;
    isProcessingRequest = true;

    if (isFirst) {
      currentPage = 1;
      hasMore = true;
      setSuccess(
          data: BaseModel<List<ReservationModel>>(
        data: [],
        pagination: null,
        msg: '',
      ));
    }

    if (!hasMore) {
      isProcessingRequest = false;
      return;
    }

    if (currentPage == 1) {
      setLoading();
    } else {
      setLoadingMore();
    }

    if (!hasMore) return;
    if (currentPage == 1) {
      setLoading();
    } else {
      setLoadingMore();
    }

    final result = await baseCrudUseCase<BaseModel<List<ReservationModel>>>(
      CrudBaseParams(
        api: ApiConstants.reservations,
        queryParameters: {'page': currentPage},
        httpRequestType: HttpRequestType.get,
        mapper: (json) {
          return BaseModel<List<ReservationModel>>(
            msg: json['msg'] ?? '',
            data: (json['reservations'] as List)
                .map((e) => ReservationModel.fromJson(e))
                .toList(),
          );
        },
      ),
    );

    result.when(
      (response) {
        if (response.pagination!.first.lastPage > currentPage) {
          currentPage++;
        } else {
          hasMore = false;
        }

        if (state.data!.data != null) {
          setSuccess(
            data: BaseModel(
              msg: response.msg,
              data: [...state.data!.data!, ...?response.data!.data],
              pagination: response.pagination,
            ),
          );
        }
      },
      (error) {
        setError(errorMessage: error.message);
        showErrorToast(error.message);
      },
    );

    isProcessingRequest = false;
  }

  Future<void> deleteFav(String id) async {
    final current = state.data?.data ?? [];
    final updated = List<ReservationModel>.from(current)
      ..removeWhere((element) => element.property.id == int.parse(id));

    setSuccess(
      data: BaseModel(
        msg: '',
        data: updated,
        pagination: state.data?.pagination,
      ),
    );
  }
}

class ReservationModel {
  final int id;
  final String name;
  final String mobile;
  final int userId;
  final Property property;
  final Appointment appointment;
  final String status;
  final String? reason;

  ReservationModel({
    required this.id,
    required this.name,
    required this.mobile,
    required this.userId,
    required this.property,
    required this.appointment,
    required this.status,
    this.reason,
  });

  factory ReservationModel.fromJson(Map<String, dynamic> json) {
    return ReservationModel(
      id: json['id'],
      name: json['name'],
      mobile: json['mobile'],
      userId: json['user_id'],
      property: Property.fromJson(json['property']),
      appointment: Appointment.fromJson(json['appointment']),
      status: json['status'],
      reason: json['reason'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'mobile': mobile,
      'user_id': userId,
      'property': property.toJson(),
      'appointment': appointment.toJson(),
      'status': status,
      'reason': reason,
    };
  }
}

class Property {
  final int id;
  final String title;
  final List<String> images;
  final String rate;

  Property({
    required this.id,
    required this.title,
    required this.images,
    required this.rate,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['id'],
      title: json['title'],
      images: (json['images'] as List).map((e) => e.toString()).toList(),
      rate: json['rate'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'images': images,
      'rate': rate,
    };
  }
}

class Appointment {
  final int id;
  final String date;
  final String time;
  final String dateTimeFormatted;

  Appointment({
    required this.id,
    required this.date,
    required this.time,
    required this.dateTimeFormatted,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['id'],
      date: json['date'],
      time: json['time'],
      dateTimeFormatted: json['date_time_formated'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date,
      'time': time,
      'date_time_formated': dateTimeFormatted,
    };
  }
}
