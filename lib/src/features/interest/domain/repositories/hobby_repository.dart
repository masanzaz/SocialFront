import 'package:dating/src/core/params/request_parameter.dart';
import 'package:dating/src/features/interest/domain/models/interest_model.dart';

abstract class HobbyRepository {
  Future<List<InterestModel>> getAllHobbies(RequestParameter params);
}