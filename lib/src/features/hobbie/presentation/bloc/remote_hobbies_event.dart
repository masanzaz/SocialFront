import 'package:equatable/equatable.dart';

abstract class RemoteHobbiesEvent extends Equatable {

  @override
  List<Object> get props => [];
}

class ServiceLoad extends RemoteHobbiesEvent {}
