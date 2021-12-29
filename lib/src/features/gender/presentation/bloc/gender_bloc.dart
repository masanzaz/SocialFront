import 'package:dating/src/features/gender/domain/repositories/gender_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc.dart';

class GenderBloc extends Bloc<GendersEvent, GenderState> {
  final GenderRepository repository;
  GenderBloc({required this.repository}) : super(const GenderState()) {
    on<ServiceLoad>(
      _onPostFetched
    );
  }

  Future<void> _onPostFetched(
      ServiceLoad event,
      Emitter<GenderState> emit,
      ) async {

    try {
      if (state.status == GenderStatus.initial) {
        final genders = await repository.getAllGenders();
        return emit(state.copyWith(
          status: GenderStatus.success,
            genders: genders
        ));
      }
      final genders = await repository.getAllGenders();
      genders.isEmpty
          ? emit(state.copyWith())
          : emit(
        state.copyWith(
          status: GenderStatus.success,
            genders: List.of(state.genders)..addAll(genders)
        ),
      );
    } catch (_) {
      emit(state.copyWith(status: GenderStatus.failure));
    }
  }
}