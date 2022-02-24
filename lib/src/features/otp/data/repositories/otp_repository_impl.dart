import 'package:dating/src/core/params/otp_parameter.dart';
import 'package:dating/src/core/utils/resources/constants.dart';
import 'package:dating/src/features/otp/domain/repositories/otp_repository.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

class OtpRepositoryImpl implements OtpRepository {
  final _path = 'Account';

  @override
  Future<bool> ConfirmPhoneNumber(OtpParameter otpParameter) async {
    var path =  'Account/ConfirmPhoneNumber';
    var url = Uri.parse(BaseUrl + path);
    var body = convert.jsonEncode(otpParameter);
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: body);
    print("${response.statusCode}");
    print("${response.body}");
    return convert.jsonDecode(response.body)["data"];
  }

  @override
  Future<bool> ValidateTokenByPhone(OtpParameter otpParameter) async {
    var path =  'Account/ValidatePhoneNumber';
    var url = Uri.parse(BaseUrl + path);
    var body = convert.jsonEncode(otpParameter);
    var response = await http.post(url,
        headers: {"Content-Type": "application/json"},
        body: body);
    print("${response.statusCode}");
    print("${response.body}");
    return convert.jsonDecode(response.body)["data"];
  }
}