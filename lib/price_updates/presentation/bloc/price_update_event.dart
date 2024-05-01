import 'package:flutter/material.dart';

@immutable
abstract class PriceUpdateEvent {
  const PriceUpdateEvent();
}

@immutable
class SubscribeToStreamEvent extends PriceUpdateEvent {
  const SubscribeToStreamEvent();
}
