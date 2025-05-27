
import 'package:manazel/src/features/register/domain/entitiy/register_user.dart';

class RegisterUserModel extends RegisterUser {
  RegisterUserModel({
    required super.name,
    required super.email,
    required super.mobile,
    required super.id,
    required super.accessToken,
    required super.isActive,
  });

  factory RegisterUserModel.fromJson(Map<String, dynamic> json) {
    return RegisterUserModel(
      name: json['name'],
      email: json['email'],
      mobile: json['mobile'],
      id: json['id'],
      accessToken: json['access_token'],
      isActive: json['is_active'],
    );
  }
}
