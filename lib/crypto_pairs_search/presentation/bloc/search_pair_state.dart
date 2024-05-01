import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../crypto_pairs/data/model/models.dart';

@immutable
abstract class SearchPairState extends Equatable {}

class InitialSearchState extends SearchPairState {
  @override
  List<Object?> get props => [];
}

class SearchLoadingState extends SearchPairState {
  @override
  List<Object?> get props => [];
}

class SearchEmptyResultsState extends SearchPairState {
  @override
  List<Object?> get props => [];
}

class PairsSearchResultState extends SearchPairState {
  final List<PairSymbol> pairs;

  PairsSearchResultState(
    this.pairs,
  );
  @override
  List<Object?> get props => [pairs];
}
