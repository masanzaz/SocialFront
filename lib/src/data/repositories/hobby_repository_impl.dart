

import 'package:dating/src/data/datasources/remote/api_service.dart';
import 'package:dating/src/domain/entities/hobby.dart';
import 'package:dating/src/domain/params/request_parameter.dart';
import 'package:dating/src/domain/repositories/hobby_repository.dart';

class HobbyRepositoryImpl implements HobbyRepository {
  final APIService apiService;
  const HobbyRepositoryImpl(this.apiService);

  @override
  Future<List<Hobby>> GetAllHobbies(RequestParameter params) async {

    var httpResponse = await apiService.getHobbies(params);
    return httpResponse;

  }
}