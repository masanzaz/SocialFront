import 'package:dating/src/features/disability/domain/models/disability_model.dart';
import 'package:equatable/equatable.dart';

enum DisabilityStatus { initial, success, failure }

class RemoteDisabilitiesState extends Equatable {
  const RemoteDisabilitiesState({
    this.status = DisabilityStatus.initial,
    this.disabilities = const <DisabilityModel>[]
  });

  final DisabilityStatus status;
  final List<DisabilityModel> disabilities;

  RemoteDisabilitiesState copyWith({
    DisabilityStatus? status,
    List<DisabilityModel>? disabilities
  }) {
    return RemoteDisabilitiesState(
      status: status ?? this.status,
        disabilities: disabilities ?? this.disabilities
    );
  }

  @override
  String toString() {
    return '''DisabilitiesState { status: $status, posts: ${disabilities.length} }''';
  }

  @override
  List<Object> get props => [status, disabilities];
}

class DisabilityInitState extends RemoteDisabilitiesState {
}

class DisabilityLoading extends RemoteDisabilitiesState {
}
