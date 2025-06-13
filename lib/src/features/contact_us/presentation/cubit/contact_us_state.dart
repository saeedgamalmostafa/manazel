part of 'contact_us_cubit.dart';

@immutable
sealed class ContactUsState {}

class ContactInitial extends ContactUsState {}

class ContactLoading extends ContactUsState {}

class ContactSuccess extends ContactUsState {}

class ContactFailure extends ContactUsState {
  final String error;
  ContactFailure(this.error);
}
