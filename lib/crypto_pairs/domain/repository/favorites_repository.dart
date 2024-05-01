import 'package:dartz/dartz.dart';

import '../../data/model/models.dart';

abstract class FavoritesRepo {
  Either<Error, List<PairSymbol>> getFavorites();
  Future<Either<Error, bool>> addToFavorite(PairSymbol asset);
  Future<Either<Error, bool>> deleteFavorite(PairSymbol asset);
}
