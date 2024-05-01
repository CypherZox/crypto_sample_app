import 'package:crypto_app/crypto_pairs/data/model/pair_symbol.dart';
import 'package:flutter/material.dart';

@immutable
abstract class FavoritePairEvent {
  const FavoritePairEvent();
}

@immutable
class GetFavoritePairsEvent extends FavoritePairEvent {
  const GetFavoritePairsEvent();
}

@immutable
class AddToFavoritesPairsEvent extends FavoritePairEvent {
  final PairSymbol pair;
  const AddToFavoritesPairsEvent(this.pair);
}

@immutable
class DeleteFromFavoritesPairsEvent extends FavoritePairEvent {
  final PairSymbol pair;
  const DeleteFromFavoritesPairsEvent(this.pair);
}
