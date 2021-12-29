import 'package:dating/src/presentation/features/discover/model/discover_person_model.dart';
import 'package:equatable/equatable.dart';

enum PersonsStatus { initial, success, failure }

class PersonsState extends Equatable {
  const PersonsState({
    this.status = PersonsStatus.initial,
    this.persons = const <DiscoverPersonalModel>[]
  });

  final PersonsStatus status;
  final List<DiscoverPersonalModel> persons;

  PersonsState copyWith({
    PersonsStatus? status,
    List<DiscoverPersonalModel>? persons
  }) {
    return PersonsState(
      status: status ?? this.status,
        persons: persons ?? this.persons
    );
  }

  @override
  String toString() {
    return '''PersonsState { status: $status, persons: ${persons.length} }''';
  }

  @override
  List<Object> get props => [status, persons];
}

class PersonsInitState extends PersonsState {
}

class PersonsLoading extends PersonsState {
}
