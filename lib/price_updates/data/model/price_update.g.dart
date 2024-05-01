// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_update.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PriceUpdate _$PriceUpdateFromJson(Map<String, dynamic> json) => PriceUpdate(
      eventType: json['e'] as String,
      eventTime: (json['E'] as num).toInt(),
      symbol: json['s'] as String,
      markPrice: json['p'] as String,
      indexPrice: json['i'] as String,
      estimatedSettlePrice: json['P'] as String,
      fundingRate: json['r'] as String,
      nextFundingTime: (json['T'] as num).toInt(),
    );

Map<String, dynamic> _$PriceUpdateToJson(PriceUpdate instance) =>
    <String, dynamic>{
      'e': instance.eventType,
      'E': instance.eventTime,
      's': instance.symbol,
      'p': instance.markPrice,
      'i': instance.indexPrice,
      'P': instance.estimatedSettlePrice,
      'r': instance.fundingRate,
      'T': instance.nextFundingTime,
    };
