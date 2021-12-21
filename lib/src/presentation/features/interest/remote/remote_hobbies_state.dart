import 'package:dating/src/domain/entities/hobby.dart';
import 'package:dating/src/domain/params/request_parameter.dart';
import 'package:equatable/equatable.dart';

abstract  class RemoteHobbiesState extends Equatable {
  const RemoteHobbiesState();

  @override
  List<Object?> get props => [];
}

class HobbyEmpty extends RemoteHobbiesState {
}

class HobbyLoading extends RemoteHobbiesState {
}

class HobbyLoaded extends RemoteHobbiesState {
  final List<Hobby> hobbies;
  HobbyLoaded({required this.hobbies});

  @override
  List<Object> get props => [hobbies];
}

class HobbyError extends RemoteHobbiesState {
  final error;
  HobbyError({this.error});
}