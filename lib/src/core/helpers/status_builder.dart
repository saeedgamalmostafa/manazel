import 'package:flutter/cupertino.dart';
import 'package:manazel/src/config/language/locale_keys.g.dart';
import 'package:manazel/src/config/res/color_manager.dart';
import 'package:manazel/src/core/extensions/text_style_extensions.dart';
import 'package:manazel/src/core/shared/base_state.dart';
import 'package:manazel/src/core/shared/cubits/lookups_cubit/presentation/cubit/base_cubit/async_cubit.dart';
import 'package:manazel/src/core/widgets/custom_loading.dart';

class StatusBuilder<T> extends StatelessWidget {
  final AsyncState<T> data;
  final String? errorMessage;
  final Widget Function(T data, BuildContext context) onSuccess;
  final Widget Function()? onFail;
  final Widget Function()? onLoading;
  final Widget? shamierWidget;
  const StatusBuilder(
      {super.key,
      required this.data,
      required this.onSuccess,
      this.onFail,
      this.shamierWidget,
      this.errorMessage,
      this.onLoading});

  @override
  Widget build(BuildContext context) {
    return data.status.when(onSuccess: () {
      return onSuccess(data.data, context);
    }, onLoading: () {
      return onLoading?.call() ??
          shamierWidget ??
          Center(child: CustomLoading.showLoadingView());
    }, onError: () {
      return onFail?.call() ??
          CenterErrorWidget(
              message: errorMessage ?? LocaleKeys.errorexeptionNointernetdesc);
    });
  }
}

class CenterErrorWidget extends StatelessWidget {
  const CenterErrorWidget({super.key, required this.message});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(color: AppColors.error).medium.s12,
      ),
    );
  }
}
