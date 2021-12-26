import 'package:dating/src/core/params/request_parameter.dart';
import 'package:dating/src/features/disability/domain/models/disability_model.dart';

abstract class DisabilityRepository {
  Future<List<DisabilityModel>> getAllDisabilities(RequestParameter params);
}