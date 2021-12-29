import 'base_parameter.dart';
class DiscoverParameter  extends BaseParameter{
  int personId;
  DiscoverParameter({apiKey, page, pageSize, required this.personId}) : super(apiKey: apiKey, page: page, pageSize: pageSize);

}