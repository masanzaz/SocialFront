import 'package:dating/src/core/params/discover_parameter.dart';
import 'package:dating/src/features/person/data/repositories/person_repository_impl.dart';
import 'package:dating/src/features/person/domain/repositories/person_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc.dart';

class PersonsBloc extends Bloc<PersonsEvent, PersonsState> {
  final PersonRepository repository;
  PersonsBloc({required this.repository}) : super(const PersonsState()) {
    on<ServiceLoad>(
      _onPostFetched
    );
  }

  Future<void> _onPostFetched(
      ServiceLoad event,
      Emitter<PersonsState> emit,
      ) async {
    try {
      var person = await  repository.getPerson();
      DiscoverParameter params = new DiscoverParameter(personId: 1);
      if (state.status == PersonsStatus.initial) {
        final persons = await repository.discoverPersons(params);
        return emit(state.copyWith(
          status: PersonsStatus.success,
            persons: persons
        ));
      }
      final persons = await repository.discoverPersons(params);
      persons.isEmpty
          ? emit(state.copyWith())
          : emit(
        state.copyWith(
          status: PersonsStatus.success,
            persons: List.of(state.persons)..addAll(persons)
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: PersonsStatus.failure));
    }
  }
}