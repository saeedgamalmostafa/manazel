import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:manazel/src/core/helpers/toast.dart';
import 'package:manazel/src/core/navigator/app_navigator.dart';
import 'package:manazel/src/core/network/api_endpoints.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/domain/base_domain_imports.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/presentation/cubit/base_cubit/async_cubit.dart';
import 'package:manazel/src/core/shared/cubits/user_cubit/user_cubit.dart';
import 'package:manazel/src/core/shared/models/user_model.dart';
import 'package:manazel/src/features/app_layout/app_layout_imports.dart';

class EditProfileCubit extends AsyncCubit with ProfileContrlers {
  EditProfileCubit() : super(null);

  Future<void> editProfile() async {
    final result = await baseCrudUseCase<UserModel>(CrudBaseParams(
        api: ApiConstants.editProifle,
        httpRequestType: HttpRequestType.post,
        body: {'name': nameController.text, 'email': emailController.text},
        mapper: (json) => UserModel.fromJson(json['user'])));
    result.when(
      (response) {
        UserCubit.instance.setUserLoggedIn(
            user: response.data!, token: response.data!.accessToken ?? '');
        Go.pushAndRemoveUntil(
          const AppLayoutScreen(),
          transitionType: TransitionType.slideFromRight,
        );
      },
      (error) {
        showErrorToast(error.message);
      },
    );
  }
}

mixin ProfileContrlers {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
}
