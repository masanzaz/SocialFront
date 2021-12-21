import 'package:dating/src/domain/entities/hobby.dart';
import 'package:dating/src/domain/params/request_parameter.dart';
import 'package:dating/src/domain/repositories/hobby_repository.dart';
import 'package:dating/src/presentation/features/interest/remote/remote_hobbies_event.dart';
import 'package:dating/src/presentation/features/interest/remote/remote_hobbies_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RemoteHobbiesBloc extends Bloc<RemoteHobbiesEvent, RemoteHobbiesState> {
  final HobbyRepository repository;

  RemoteHobbiesBloc(this.repository)  : super(HobbyLoading());

  @override
  HobbyEmpty get initialState => HobbyEmpty();

  @override
  Stream<RemoteHobbiesState> mapEventToState(RemoteHobbiesEvent event) async* {
    if (event is ServiceLoad) {
      print("Service load method");
      yield HobbyLoading();

      try {
        RequestParameter params = new RequestParameter();
        final List<Hobby> hobbies = await repository.GetAllHobbies(params);
        yield HobbyLoaded(hobbies: hobbies);
      } catch (_) {
        yield HobbyError();
      }
    }
    if (event is ServiceCreate) {
      //some code
    }


  }
}