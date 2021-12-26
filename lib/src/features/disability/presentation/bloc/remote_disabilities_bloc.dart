import 'package:dating/src/core/params/request_parameter.dart';
import 'package:dating/src/features/disability/domain/repositories/disability_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc.dart';

class RemoteDisabilitiesBloc extends Bloc<RemoteDisabilitiesEvent, RemoteDisabilitiesState> {
  final DisabilityRepository repository;
  RemoteDisabilitiesBloc({required this.repository}) : super(const RemoteDisabilitiesState()) {
    on<ServiceLoad>(
      _onPostFetched
    );
  }

  Future<void> _onPostFetched(
      ServiceLoad event,
      Emitter<RemoteDisabilitiesState> emit,
      ) async {

    final RequestParameter params2  = new RequestParameter();
    try {
      if (state.status == DisabilityStatus.initial) {

        final disabilities = await repository.getAllDisabilities(params2);
        return emit(state.copyWith(
          status: DisabilityStatus.success,
            disabilities: disabilities
        ));
      }
      final disabilities = await repository.getAllDisabilities(params2);
      disabilities.isEmpty
          ? emit(state.copyWith())
          : emit(
        state.copyWith(
          status: DisabilityStatus.success,
            disabilities: List.of(state.disabilities)..addAll(disabilities)
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: DisabilityStatus.failure));
    }
  }
}