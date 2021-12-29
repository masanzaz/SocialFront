import 'package:equatable/equatable.dart';

abstract class GendersEvent extends Equatable {

  @override
  List<Object> get props => [];
}

class ServiceLoad extends GendersEvent {}
