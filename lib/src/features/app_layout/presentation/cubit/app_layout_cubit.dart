import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_layout_state.dart';

class AppLayoutCubit extends Cubit<AppLayoutState> {
  AppLayoutCubit() : super(AppLayoutState(index: 0));

  initData(TickerProviderStateMixin tickerProvider,int currentIndex) {
    state.controller = TabController(length:5, vsync: tickerProvider);
    changeIndex( currentIndex);
  }

  void changeIndex(int index) {
    emit(state.copyWith(index: index));
  }

  void changeController(TabController controller) {
    emit(state.copyWith(controller: controller));
  }
}
