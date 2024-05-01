import 'package:crypto_app/crypto_pairs/data/model/pair_symbol.dart';
import 'package:crypto_app/crypto_pairs/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import 'favorites_usecase.dart';

@Injectable(as: FavoritesUseCase)
class FavoritesUseCaseImpl implements FavoritesUseCase {
  FavoritesUseCaseImpl(this._favoritesRepo);

  final FavoritesRepo _favoritesRepo;

  @override
  Future<Either<Error, bool>> addFavorites(PairSymbol asset) {
    return _favoritesRepo.addToFavorite(asset);
  }

  @override
  Future<Either<Error, bool>> deleteFavorites(PairSymbol asset) {
    return _favoritesRepo.deleteFavorite(asset);
  }

  @override
  Either<Error, List<PairSymbol>> getFavorites() {
    return _favoritesRepo.getFavorites();
  }
}
