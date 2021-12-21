import 'package:dating/src/domain/entities/hobby.dart';
import 'package:dating/src/domain/params/request_parameter.dart';

abstract class HobbyRepository {

  Future<List<Hobby>> GetAllHobbies(RequestParameter params);


}