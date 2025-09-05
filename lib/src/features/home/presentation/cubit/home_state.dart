part of '../imports/presentaion_imports.dart';

final class HomeState extends Equatable {
  final BaseStatus baseStatus;
  final String errorMessage;

  const HomeState({
    required this.baseStatus,
    this.errorMessage = ConstantManager.emptyText,
  });

  factory HomeState.initial() {
    return const HomeState(
      baseStatus: BaseStatus.initial,
    );
  }

  HomeState copyWith({
    BaseStatus? baseStatus,
    String? errorMessage,
  }) {
    return HomeState(
      baseStatus: baseStatus ?? this.baseStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [
        baseStatus,
        errorMessage,
      ];
}
