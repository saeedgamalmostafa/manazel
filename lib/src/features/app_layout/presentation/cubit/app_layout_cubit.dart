import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manazel/src/core/widgets/default_bottom_sheet.dart';
import 'package:manazel/src/features/rate/rate_imports.dart';

part 'app_layout_state.dart';

class AppLayoutCubit extends Cubit<AppLayoutState> {
  AppLayoutCubit() : super(AppLayoutState(index: 0));

  initData(TickerProviderStateMixin tickerProvider, int currentIndex) {
    state.controller = TabController(length: 3, vsync: tickerProvider);
    changeIndex(currentIndex);
  }

  void changeIndex(int index) {
    // if (index == 2) {
    //   showDefaultBottomSheet(
    //     child: const RateBottomSheet(),
    //   );
    state.controller!.animateTo(index);

    //   return;
    // } else {
    emit(state.copyWith(index: index));
    // }
  }

  void changeController(TabController controller) {
    emit(state.copyWith(controller: controller));
  }
}
