class RegisterUser {
  final String name;
  final String email;
  final String mobile;
  final int id;
  final String accessToken;
  final bool isActive;

  RegisterUser({
    required this.name,
    required this.email,
    required this.mobile,
    required this.id,
    required this.accessToken,
    required this.isActive,
  });
}
