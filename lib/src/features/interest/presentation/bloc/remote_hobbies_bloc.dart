import 'package:dating/src/core/params/request_parameter.dart';
import 'package:dating/src/features/interest/domain/repositories/hobby_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc.dart';

class RemoteHobbiesBloc extends Bloc<RemoteHobbiesEvent, RemoteHobbiesState> {
  final HobbyRepository repository;
  RemoteHobbiesBloc({required this.repository}) : super(const RemoteHobbiesState()) {
    on<ServiceLoad>(
      _onPostFetched
    );
  }

  Future<void> _onPostFetched(
      ServiceLoad event,
      Emitter<RemoteHobbiesState> emit,
      ) async {

    final RequestParameter params2  = new RequestParameter();
    try {
      if (state.status == HobbyStatus.initial) {

        final posts = await repository.getAllHobbies(params2);
        return emit(state.copyWith(
          status: HobbyStatus.success,
          hobbies: posts
        ));
      }
      final posts = await repository.getAllHobbies(params2);
      posts.isEmpty
          ? emit(state.copyWith())
          : emit(
        state.copyWith(
          status: HobbyStatus.success,
            hobbies: List.of(state.hobbies)..addAll(posts)
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: HobbyStatus.failure));
    }
  }

  @override
  Stream<RemoteHobbiesState> mapEventToState(RemoteHobbiesEvent event) async* {
   /* if (event is ServiceLoad) {
      print("Service load method");
      yield HobbyLoading();

      try {
        RequestParameter params = new RequestParameter();
        final List<InterestModel> hobbies = await repository.GetAllHobbies(params);
        yield HobbyLoaded(hobbies: hobbies);
      } catch (_) {
        yield HobbyError();
      }
    }
*/


  }
}