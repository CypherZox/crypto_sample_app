import 'package:crypto_app/crypto_pairs/domain/usecase/favorites_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'favorites_event.dart';
import 'favorites_state.dart';

@Injectable()
class FavoritePairBloc extends Bloc<FavoritePairEvent, FavoritePairState> {
  final FavoritesUseCase _favoritesUseCase;

  FavoritePairBloc(this._favoritesUseCase)
      : super(FavoritePairsInitialState()) {
    on<GetFavoritePairsEvent>((event, emit) async {
      emit(FavoritePairsLoadingState());
      try {
        final pairs = _favoritesUseCase.getFavorites();

        pairs.fold((l) => emit(FavoritesPairsErrorState(l)),
            (pairs) => emit(FavoritesPairsLoadedState(pairs)));
      } catch (e) {
        final error = Error();
        emit(FavoritesPairsErrorState(error));
      }
    });
    on<AddToFavoritesPairsEvent>((event, emit) async {
      final pair = event.pair;
      try {
        final result = await _favoritesUseCase.addFavorites(pair);

        result.fold((l) => emit(FavoritesPairsErrorState(l)), (r) {
          final pairs = _favoritesUseCase.getFavorites();

          pairs.fold((l) => emit(FavoritesPairsErrorState(l)),
              (pairs) => emit(FavoritesPairsLoadedState(pairs)));
        });
      } catch (e) {
        final error = Error();
        emit(FavoritesPairsErrorState(error));
      }
    });
    on<DeleteFromFavoritesPairsEvent>((event, emit) async {
      final pair = event.pair;
      try {
        final result = await _favoritesUseCase.deleteFavorites(pair);
        result.fold((l) => emit(FavoritesPairsErrorState(l)), (r) {
          final pairs = _favoritesUseCase.getFavorites();

          pairs.fold((l) => emit(FavoritesPairsErrorState(l)), (pairs) {
            emit(FavoritesPairsLoadedState(pairs));
          });
        });
      } catch (e) {
        final error = Error();
        emit(FavoritesPairsErrorState(error));
      }
    });
  }
}
