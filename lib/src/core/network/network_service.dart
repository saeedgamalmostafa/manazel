import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/usecases/base_model.dart';

import 'network_request.dart';

abstract interface class NetworkService {
  Future<BaseModel<Model>> callApi<Model>(
    NetworkRequest networkRequest, {
    Model Function(dynamic json)? mapper,
  });

  void setToken(String token);

  void removeToken();
}
