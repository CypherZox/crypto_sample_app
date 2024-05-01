import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecase/use_case.dart';
import 'bloc.dart';

@Injectable()
@lazySingleton
class PairsBloc extends Bloc<PairSymbolEvent, PairSymbolState> {
  final PairsUseCase _pairsUseCase;

  PairsBloc(this._pairsUseCase) : super(PairsInitialState()) {
    on<FetchPairsEvent>((event, emit) async {
      emit(PairsLoadingState());
      try {
        final pairs = await _pairsUseCase.requestPairs();
        pairs.fold((l) => emit(PairsErrorState(l)),
            (pairs) => emit(PairsLoadedState(pairs, pairs.sublist(0, 25))));
      } catch (e) {
        final error = Error();
        emit(PairsErrorState(error));
      }
    });
    on<LoadNextPairsEvent>((event, emit) async {
      final currentState = state;
      if (currentState is PairsLoadedState) {
        final allPairs = currentState.pairs;
        final visiblePairs = currentState.visiblePairs;
        final startIndex = visiblePairs.length;
        final endIndex = startIndex + 25;
        if (endIndex < allPairs.length) {
          print('endIndex < allPairs.length: ');
          final nextBatch = allPairs.sublist(startIndex, endIndex);
          final updatedVisiblePairs = List.of(visiblePairs)..addAll(nextBatch);
          emit(PairsLoadingState());

          emit(PairsLoadedState(allPairs, updatedVisiblePairs));
        } else if (endIndex > allPairs.length) {
          emit(PairsLoadingState());

          emit(PairsLoadedState(allPairs, allPairs));
        }
      }
    });
  }
}
