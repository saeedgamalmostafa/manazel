part of 'app_layout_cubit.dart';

class AppLayoutState extends Equatable {
  final int index;
  TabController? controller;

  AppLayoutState({this.index = 0, this.controller});

  AppLayoutState copyWith({int? index, TabController? controller}) {
    return AppLayoutState(
      index: index ?? this.index,
      controller: controller ?? this.controller,
    );
  }

  @override
  List<Object> get props => [index, controller!];
}
