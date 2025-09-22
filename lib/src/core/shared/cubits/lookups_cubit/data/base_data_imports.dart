import 'package:injectable/injectable.dart';
import 'package:manazel/src/core/error/failure.dart';
import 'package:manazel/src/core/extensions/error_handler_extension.dart';
import 'package:manazel/src/core/network/network_request.dart';
import 'package:manazel/src/core/network/network_service.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/usecases/pagination_response.dart';
import 'package:multiple_result/multiple_result.dart';

import '../domain/base_domain_imports.dart';

part 'datasources/base_remote_data_source.dart';
part 'repositories/base_repository_impl.dart';