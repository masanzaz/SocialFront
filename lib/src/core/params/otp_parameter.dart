class OtpParameter {
  final String phoneNumber;
  final String token;

  OtpParameter({
    required this.phoneNumber,
    required this.token
  });

  Map<String, dynamic> toJson() => {
    "phoneNumber": phoneNumber,
    "token": token
  };
}
