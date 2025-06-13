import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit() : super(ContactInitial());

  void sendMessage(String message) async {
    if (message.trim().isEmpty) {
      emit(ContactFailure("الرسالة لا يمكن أن تكون فارغة"));
      return;
    }

    emit(ContactLoading());

    try {
      await Future.delayed(Duration(seconds: 2));
      emit(ContactSuccess());
    } catch (e) {
      emit(ContactFailure("فشل في إرسال الرسالة"));
    }
  }
}
