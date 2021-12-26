import 'package:dating/src/core/utils/resources/constants.dart';

class RequestParameter {
  final String apiKey;
  final int page;
  final int pageSize;

  const RequestParameter({
    this.apiKey = ApiKey,
    this.page = 1,
    this.pageSize = 20
  });
}
