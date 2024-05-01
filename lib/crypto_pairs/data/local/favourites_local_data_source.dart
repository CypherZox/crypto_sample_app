import 'package:crypto_app/crypto_pairs/data/model/pair_symbol.dart';
import 'package:dartz/dartz.dart';

abstract class FavoritesLocalDataSource {
  List<PairSymbol> getFavorites();
  Future<bool> addToFavorite(PairSymbol asset);
  Future<bool> deleteFavorite(PairSymbol asset);
}
