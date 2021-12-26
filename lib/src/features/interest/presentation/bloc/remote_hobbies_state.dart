import 'package:dating/src/features/interest/domain/models/interest_model.dart';
import 'package:equatable/equatable.dart';

enum HobbyStatus { initial, success, failure }

class RemoteHobbiesState extends Equatable {
  const RemoteHobbiesState({
    this.status = HobbyStatus.initial,
    this.hobbies = const <InterestModel>[]
  });

  final HobbyStatus status;
  final List<InterestModel> hobbies;

  RemoteHobbiesState copyWith({
    HobbyStatus? status,
    List<InterestModel>? hobbies
  }) {
    return RemoteHobbiesState(
      status: status ?? this.status,
        hobbies: hobbies ?? this.hobbies
    );
  }

  @override
  String toString() {
    return '''PostState { status: $status, posts: ${hobbies.length} }''';
  }

  @override
  List<Object> get props => [status, hobbies];
}


class HobbyInitState extends RemoteHobbiesState {
}

class HobbyLoading extends RemoteHobbiesState {
}
/*
class HobbyLoaded extends RemoteHobbiesState {
  final List<InterestModel> hobbies;
  HobbyLoaded({required this.hobbies});

  @override
  List<Object> get props => [hobbies];
}

class HobbyError extends RemoteHobbiesState {
  final error;
  HobbyError({this.error});
}
*/
