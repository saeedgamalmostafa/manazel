import 'package:manazel/src/features/login/domain/entitiy/user.dart';

class UserModel extends User {
  UserModel({
    required super.name,
    required super.email,
    required super.mobile,
    required super.id,
    required super.accessToken,
    required super.isActive,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      mobile: json['mobile'],
      id: json['id'],
      accessToken: json['access_token'],
      isActive: json['is_active'],
    );
  }
}
