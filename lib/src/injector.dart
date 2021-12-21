import 'package:dating/src/data/repositories/hobby_repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'data/datasources/remote/api_service.dart';
import 'domain/repositories/hobby_repository.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {

  locator.registerSingleton<APIService>(APIService());
  locator.registerSingleton<HobbyRepository>(
    HobbyRepositoryImpl(locator()),
  );


}
