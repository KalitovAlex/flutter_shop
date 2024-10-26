import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../models/concert_model.dart';
import '../repository/concert_repository.dart';

part 'concert_bloc.freezed.dart';

@freezed
class ConcertState with _$ConcertState {
  const factory ConcertState.initial() = _Initial;
  const factory ConcertState.loading() = _Loading;
  const factory ConcertState.loaded(List<ConcertModel> concerts) = _Loaded;
  const factory ConcertState.error(String message) = _Error;
}

class ConcertBloc extends Cubit<ConcertState> {
  final ConcertRepository _repository;

  ConcertBloc(this._repository) : super(const ConcertState.initial());

  Future<void> loadConcerts() async {
    emit(const ConcertState.loading());
    try {
      final concerts = await _repository.getConcerts();
      emit(ConcertState.loaded(concerts));
    } catch (e) {
      emit(ConcertState.error(e.toString()));
    }
  }
}
