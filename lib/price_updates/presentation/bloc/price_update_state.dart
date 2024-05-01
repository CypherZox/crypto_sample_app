import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../data/model/price_update.dart';

@immutable
abstract class PriceUpdateState extends Equatable {}

class PriceInitialState extends PriceUpdateState {
  @override
  List<Object?> get props => [];
}

class PriceUpdatedState extends PriceUpdateState {
  final List<PriceUpdate> priceUpdate;
  PriceUpdatedState(this.priceUpdate);
  @override
  List<Object?> get props => [priceUpdate];
}
