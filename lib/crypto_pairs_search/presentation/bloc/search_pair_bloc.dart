import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'search_pair_event.dart';
import 'search_pair_state.dart';

@Injectable()
class SearchPairsBloc extends Bloc<SearchPairEvent, SearchPairState> {
  SearchPairsBloc() : super(InitialSearchState()) {
    on<SearchPairsEvent>((event, emit) {
      emit(SearchLoadingState());
      final pairs = event.listOfPairs;
      final query = event.query;
      final result = pairs
          .where((element) => ((element).baseAsset!)
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
      if (result.isNotEmpty) {
        emit(PairsSearchResultState(result));
      } else {
        emit(SearchEmptyResultsState());
      }
    });
    on<SearchResetEvent>((event, emit) {
      emit(InitialSearchState());
    });
  }
}
