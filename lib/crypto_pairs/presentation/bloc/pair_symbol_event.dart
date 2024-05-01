import 'package:flutter/material.dart';

@immutable
abstract class PairSymbolEvent {
  const PairSymbolEvent();
}

@immutable
class FetchPairsEvent extends PairSymbolEvent {
  const FetchPairsEvent();
}

@immutable
class LoadNextPairsEvent extends PairSymbolEvent {
  const LoadNextPairsEvent();
}
