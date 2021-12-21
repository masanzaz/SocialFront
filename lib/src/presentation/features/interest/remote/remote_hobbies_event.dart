import 'package:dating/src/domain/entities/hobby.dart';
import 'package:equatable/equatable.dart';

abstract class RemoteHobbiesEvent extends Equatable {
  const RemoteHobbiesEvent();
}

class ServiceLoad extends RemoteHobbiesEvent {
  const ServiceLoad();

  @override
  List<Object> get props => [];
}

class ServiceCreate extends RemoteHobbiesEvent {
  final Hobby hobby;

  const ServiceCreate(this.hobby);

  @override
  List<Object> get props => [hobby];

  @override
  String toString() => 'Hobby Created {hobby: $hobby}';
}

class ServiceUpdate extends RemoteHobbiesEvent {
  final Hobby hobby;

  const ServiceUpdate(this.hobby);

  @override
  List<Object> get props => [hobby];

  @override
  String toString() => 'Hobby Updated {hobby: $hobby}';
}

class ServiceDelete extends RemoteHobbiesEvent {
  final Hobby hobby;

  const ServiceDelete(this.hobby);

  @override
  List<Object> get props => [hobby];

  @override
  toString() => 'Hobby Deleted {hobby: $hobby}';
}