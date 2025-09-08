import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:manazel/src/core/error/failure.dart';
import 'package:manazel/src/core/network/network_request.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/usecases/pagination_response.dart';
import 'package:multiple_result/multiple_result.dart';

import 'entities/country_entity.dart';

part 'entities/async.dart';
part 'entities/base_name_and_id_entity.dart';
part 'repositories/base_repository.dart';
part 'usecases/base_crud.dart';
part 'usecases/get_base_id_and_name_usecase.dart';
