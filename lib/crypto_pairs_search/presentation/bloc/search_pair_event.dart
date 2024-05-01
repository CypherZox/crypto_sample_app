import 'package:crypto_app/crypto_pairs/data/model/models.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SearchPairEvent {
  const SearchPairEvent();
}

@immutable
class SearchPairsEvent extends SearchPairEvent {
  final String query;
  final List<PairSymbol> listOfPairs;

  const SearchPairsEvent(this.query, this.listOfPairs);
}

@immutable
class SearchResetEvent extends SearchPairEvent {
  const SearchResetEvent();
}
