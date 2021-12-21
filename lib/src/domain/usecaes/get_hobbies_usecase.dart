import 'package:dating/src/core/usecase/usecase.dart';
import 'package:dating/src/domain/entities/hobby.dart';
import 'package:dating/src/domain/params/request_parameter.dart';
import 'package:dating/src/domain/repositories/hobby_repository.dart';

class GetHobbiesUseCase implements UseCase<List<Hobby>, RequestParameter> {
  final HobbyRepository _hobbyRepository;
  GetHobbiesUseCase(this._hobbyRepository);

  @override
  Future<List<Hobby>> call({required  params}) {
    // TODO: implement call
    return _hobbyRepository.GetAllHobbies(params);
  }
}