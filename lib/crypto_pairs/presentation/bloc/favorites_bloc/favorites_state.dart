import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../data/model/models.dart';

@immutable
abstract class FavoritePairState extends Equatable {}

class FavoritePairsLoadingState extends FavoritePairState {
  @override
  List<Object?> get props => [];
}

class FavoritePairsInitialState extends FavoritePairState {
  @override
  List<Object?> get props => [];
}

class FavoritePairsAddedSuccessfullyState extends FavoritePairState {
  @override
  List<Object?> get props => [];
}

class FavoritePairsDeletedSuccessfullyState extends FavoritePairState {
  @override
  List<Object?> get props => [];
}

class FavoritesPairsLoadedState extends FavoritePairState {
  final List<PairSymbol> pairs;

  FavoritesPairsLoadedState(
    this.pairs,
  );
  @override
  List<Object?> get props => [pairs];
}

class FavoritesPairsErrorState extends FavoritePairState {
  final Error error;

  FavoritesPairsErrorState(
    this.error,
  );
  @override
  List<Object?> get props => [error];
}
