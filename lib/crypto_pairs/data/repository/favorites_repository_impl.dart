import 'package:crypto_app/crypto_pairs/data/local/favourites_local_data_source.dart';
import 'package:crypto_app/crypto_pairs/data/model/pair_symbol.dart';
import 'package:crypto_app/crypto_pairs/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: FavoritesRepo)
class FavoritesRepoImpl implements FavoritesRepo {
  FavoritesRepoImpl(this._favoritesDataSource);

  final FavoritesLocalDataSource _favoritesDataSource;

  @override
  Future<Either<Error, bool>> addToFavorite(PairSymbol asset) async {
    try {
      final result = await _favoritesDataSource.addToFavorite(asset);
      if (result) {
        return right(result);
      } else {
        final error = Error();
        return left(error);
      }
    } catch (e) {
      final error = Error();
      return left(error);
    }
  }

  @override
  Future<Either<Error, bool>> deleteFavorite(PairSymbol asset) async {
    try {
      final result = await _favoritesDataSource.deleteFavorite(asset);
      if (result) {
        return right(result);
      } else {
        final error = Error();
        return left(error);
      }
    } catch (e) {
      final error = Error();
      return left(error);
    }
  }

  @override
  Either<Error, List<PairSymbol>> getFavorites() {
    try {
      final favorites = _favoritesDataSource.getFavorites();
      return right(favorites);
    } catch (e) {
      final error = Error();
      return left(error);
    }
  }
}
