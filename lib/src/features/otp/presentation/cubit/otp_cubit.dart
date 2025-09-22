import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
// import 'package:injectable/injectable.dart';
import 'package:manazel/src/config/res/constants_manager.dart';
import 'package:manazel/src/core/helpers/toast.dart';
import 'package:manazel/src/core/navigator/app_navigator.dart';
import 'package:manazel/src/core/network/api_endpoints.dart';
import 'package:manazel/src/core/network/network_service.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/base_domain_imports.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/presentation/cubit/base_cubit/async_cubit.dart';
import 'package:manazel/src/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:manazel/src/core/shared/models/user_model.dart';
import 'package:manazel/src/features/app_layout/app_layout_imports.dart';
import 'package:manazel/src/features/change_password/change_password_imports.dart';

import '../../../../core/helpers/request_state.dart';

part 'otp_state.dart';

class OtpCubit extends AsyncCubit {
  OtpCubit() : super(null);

  final codeController = TextEditingController();
  late String phone;
  late OtpType otpType;

  Future<void> verifyOtp() async {

  }

  Future<void> sendCode() async {

  }
}

enum OtpType { auth, canCangePhone, changePhone }
