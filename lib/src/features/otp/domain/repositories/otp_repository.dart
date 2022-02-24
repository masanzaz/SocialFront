import 'package:dating/src/core/params/otp_parameter.dart';

abstract class OtpRepository {
  Future<bool> ConfirmPhoneNumber(OtpParameter otpParameter);
  Future<bool> ValidateTokenByPhone(OtpParameter otpParameter);
}