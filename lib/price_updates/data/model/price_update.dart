import 'package:json_annotation/json_annotation.dart';

part 'price_update.g.dart';

@JsonSerializable()
class PriceUpdate {
  @JsonKey(name: 'e')
  final String eventType;
  @JsonKey(name: 'E')
  final int eventTime;
  @JsonKey(name: 's')
  final String symbol;
  @JsonKey(name: 'p')
  final String markPrice;
  @JsonKey(name: 'i')
  final String indexPrice;
  @JsonKey(name: 'P')
  final String estimatedSettlePrice;
  @JsonKey(name: 'r')
  final String fundingRate;
  @JsonKey(name: 'T')
  final int nextFundingTime;

  PriceUpdate({
    required this.eventType,
    required this.eventTime,
    required this.symbol,
    required this.markPrice,
    required this.indexPrice,
    required this.estimatedSettlePrice,
    required this.fundingRate,
    required this.nextFundingTime,
  });

  factory PriceUpdate.fromJson(Map<String, dynamic> json) =>
      _$PriceUpdateFromJson(json);

  Map<String, dynamic> toJson() => _$PriceUpdateToJson(this);
}
