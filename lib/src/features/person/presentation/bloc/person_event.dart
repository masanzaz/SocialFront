import 'package:equatable/equatable.dart';

abstract class PersonsEvent extends Equatable {

  @override
  List<Object> get props => [];
}

class ServiceLoad extends PersonsEvent {}
