import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'privacy_policy_cubit_event.dart';
part 'privacy_policy_cubit_state.dart';

class PrivacyPolicyCubitBloc extends Bloc<PrivacyPolicyCubitEvent, PrivacyPolicyCubitState> {
  PrivacyPolicyCubitBloc() : super(PrivacyPolicyCubitInitial()) {
    on<PrivacyPolicyCubitEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
