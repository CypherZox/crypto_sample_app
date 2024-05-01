import 'package:dartz/dartz.dart';

import '../../data/model/models.dart';

abstract class FavoritesUseCase {
  Either<Error, List<PairSymbol>> getFavorites();
  Future<Either<Error, bool>> addFavorites(PairSymbol asset);
  Future<Either<Error, bool>> deleteFavorites(PairSymbol asset);
}
