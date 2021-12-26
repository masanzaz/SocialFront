import 'package:equatable/equatable.dart';

abstract class RemoteDisabilitiesEvent extends Equatable {

  @override
  List<Object> get props => [];
}

class ServiceLoad extends RemoteDisabilitiesEvent {}
