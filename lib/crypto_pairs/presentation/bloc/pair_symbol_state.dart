import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../data/model/models.dart';

@immutable
abstract class PairSymbolState extends Equatable {}

class PairsLoadingState extends PairSymbolState {
  @override
  List<Object?> get props => [];
}

class PairsInitialState extends PairSymbolState {
  @override
  List<Object?> get props => [];
}

class PairsLoadedState extends PairSymbolState {
  final List<PairSymbol> pairs;
  final List<PairSymbol> visiblePairs;
  PairsLoadedState(this.pairs, this.visiblePairs);
  @override
  List<Object?> get props => [pairs];
}

class PairsErrorState extends PairSymbolState {
  final Error error;
  PairsErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
