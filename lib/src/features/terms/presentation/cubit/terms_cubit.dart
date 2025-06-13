import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'terms_state.dart';

class TermsCubit extends Cubit<TermsState> {
  TermsCubit() : super(TermsInitial());
}
