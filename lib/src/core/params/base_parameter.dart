import 'package:dating/src/core/utils/resources/constants.dart';

class BaseParameter {
  final String apiKey;
  final int page;
  final int pageSize;

  BaseParameter({
    this.apiKey = ApiKey,
    this.page = 1,
    this.pageSize = 20
  });
}
