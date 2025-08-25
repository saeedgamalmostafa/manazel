import 'package:equatable/equatable.dart';

class VerifyOtpParams extends Equatable {
  final String code;
  final String type;

  const VerifyOtpParams({
    required this.code,
    this.type = 'client',
  });

  Map<String, dynamic> toJson() => {
        'code': code,
        'type': type,
      };

  @override
  List<Object?> get props => [code, type];
}
