import 'package:manazel/src/core/helpers/toast.dart';
import 'package:manazel/src/core/network/api_endpoints.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/base_domain_imports.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/usecases/base_model.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/presentation/cubit/base_cubit/async_cubit.dart';

class NotificationsCubit
    extends AsyncCubit<BaseModel<List<NotificationModel>>?> {
  NotificationsCubit() : super(null);

  bool isFavLoading = false;

  int currentPage = 1;
  bool hasMore = true;
  bool isProcessingRequest = false;

  Future<void> getNotifications({bool isFirst = false}) async {
    if (isProcessingRequest) return;
    isProcessingRequest = true;

    if (isFirst) {
      currentPage = 1;
      hasMore = true;
      setSuccess(
          data: BaseModel<List<NotificationModel>>(
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

    final result = await baseCrudUseCase<BaseModel<List<NotificationModel>>>(
      CrudBaseParams(
        api: ApiConstants.notification,
        queryParameters: {
          'page': currentPage,
          'withPagination': 1,
          'unread': 1,
        },
        httpRequestType: HttpRequestType.get,
        mapper: (json) {
          return BaseModel<List<NotificationModel>>(
            msg: json['msg'] ?? '',
            success: json['success'] ?? true,
            data: (json['notifications'] as List)
                .map((e) => NotificationModel.fromJson(e))
                .toList(),
          );
        },
      ),
    );

    result.when(
      (response) {
        if (response.pagination!.lastPage > currentPage) {
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

  Future<void> deleteNotification(String? id) async {
    // Snapshot current state for rollback
    final prevModel = state.data;
    final prevList = List<NotificationModel>.from(prevModel?.data ?? const []);

    // Build optimistic next state
    BaseModel<List<NotificationModel>> optimisticModel;

    if (id == null) {
      // Optimistically clear all
      optimisticModel = BaseModel<List<NotificationModel>>(
        data: <NotificationModel>[],
        pagination: prevModel?.pagination,
        msg: prevModel?.msg ?? '',
        success: prevModel?.success ?? true,
      );
    } else {
      // Optimistically remove the matching item
      final nextList = prevList.where((n) => n.id != id).toList();
      optimisticModel = BaseModel<List<NotificationModel>>(
        data: nextList,
        pagination: prevModel?.pagination,
        msg: prevModel?.msg ?? '',
        success: prevModel?.success ?? true,
      );
    }

    // Optimistic update (no heavy loading)
    setSuccess(data: optimisticModel);

    // Hit API
    final result = await baseCrudUseCase(
      CrudBaseParams(
        api: ApiConstants.deleteNotification,
        body: {'notification_id': id}..removeWhere((k, v) => v == null),
        httpRequestType: HttpRequestType.post,
        mapper: (value) => {},
      ),
    );

    result.whenError(
      (error) {
        // Rollback on failure
        setError(errorMessage: error.message);
        showErrorToast(error.message);
        // restore previous list
        setSuccess(data: prevModel);
      },
    );
  }
}

class NotificationModel {
  final String id;
  final String title;
  final String message;
  final String? modelId;
  final String? modelType;
  final String type;
  final String? readAt;
  final String createdAt;

  const NotificationModel({
    required this.id,
    required this.title,
    required this.message,
    this.modelId,
    this.modelType,
    required this.type,
    this.readAt,
    required this.createdAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      message: json['message'] ?? '',
      modelId: json['model_id'],
      modelType: json['model_type'],
      type: json['type'] ?? '',
      readAt: json['read_at'],
      createdAt: json['created_at'] ?? '',
    );
  }
}
