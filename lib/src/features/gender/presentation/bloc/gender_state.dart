import 'package:dating/src/features/gender/domain/models/gender_model.dart';
import 'package:equatable/equatable.dart';

enum GenderStatus { initial, success, failure }

class GenderState extends Equatable {
  const GenderState({
    this.status = GenderStatus.initial,
    this.genders = const <GenderModel>[]
  });

  final GenderStatus status;
  final List<GenderModel> genders;

  GenderState copyWith({
    GenderStatus? status,
    List<GenderModel>? genders
  }) {
    return GenderState(
      status: status ?? this.status,
        genders: genders ?? this.genders
    );
  }

  @override
  String toString() {
    return '''GenderStatus { status: $status, posts: ${genders.length} }''';
  }

  @override
  List<Object> get props => [status, genders];
}


class GenderInitState extends GenderState {
}

class GenderLoading extends GenderState {
}