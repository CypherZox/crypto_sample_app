// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pair_symbol.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Filter _$FilterFromJson(Map<String, dynamic> json) => Filter(
      maxPrice: json['maxPrice'] as String?,
      minPrice: json['minPrice'] as String?,
      tickSize: json['tickSize'] as String?,
      minQty: json['minQty'] as String?,
      maxQty: json['maxQty'] as String?,
      stepSize: json['stepSize'] as String?,
      limit: (json['limit'] as num?)?.toInt(),
      notional: json['notional'] as String?,
      multiplierUp: json['multiplierUp'] as String?,
      multiplierDown: json['multiplierDown'] as String?,
      multiplierDecimal: json['multiplierDecimal'] as String?,
      filterType: json['filterType'] as String?,
    );

Map<String, dynamic> _$FilterToJson(Filter instance) => <String, dynamic>{
      'maxPrice': instance.maxPrice,
      'minPrice': instance.minPrice,
      'tickSize': instance.tickSize,
      'minQty': instance.minQty,
      'maxQty': instance.maxQty,
      'stepSize': instance.stepSize,
      'limit': instance.limit,
      'notional': instance.notional,
      'multiplierUp': instance.multiplierUp,
      'multiplierDown': instance.multiplierDown,
      'multiplierDecimal': instance.multiplierDecimal,
      'filterType': instance.filterType,
    };

PairSymbol _$PairSymbolFromJson(Map<String, dynamic> json) => PairSymbol(
      symbol: json['symbol'] as String?,
      pair: json['pair'] as String?,
      contractType: json['contractType'] as String?,
      deliveryDate: (json['deliveryDate'] as num?)?.toInt(),
      onboardDate: (json['onboardDate'] as num?)?.toInt(),
      status: json['status'] as String?,
      maintMarginPercent: json['maintMarginPercent'] as String?,
      requiredMarginPercent: json['requiredMarginPercent'] as String?,
      baseAsset: json['baseAsset'] as String?,
      quoteAsset: json['quoteAsset'] as String?,
      marginAsset: json['marginAsset'] as String?,
      pricePrecision: (json['pricePrecision'] as num?)?.toInt(),
      quantityPrecision: (json['quantityPrecision'] as num?)?.toInt(),
      baseAssetPrecision: (json['baseAssetPrecision'] as num?)?.toInt(),
      quotePrecision: (json['quotePrecision'] as num?)?.toInt(),
      underlyingType: json['underlyingType'] as String?,
      underlyingSubType: (json['underlyingSubType'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      settlePlan: (json['settlePlan'] as num?)?.toInt(),
      triggerProtect: json['triggerProtect'] as String?,
      liquidationFee: json['liquidationFee'] as String?,
      marketTakeBound: json['marketTakeBound'] as String?,
      maxMoveOrderLimit: (json['maxMoveOrderLimit'] as num?)?.toInt(),
      filters: (json['filters'] as List<dynamic>?)
          ?.map((e) => Filter.fromJson(e as Map<String, dynamic>))
          .toList(),
      orderTypes: (json['orderTypes'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      timeInForce: (json['timeInForce'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$PairSymbolToJson(PairSymbol instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'pair': instance.pair,
      'contractType': instance.contractType,
      'deliveryDate': instance.deliveryDate,
      'onboardDate': instance.onboardDate,
      'status': instance.status,
      'maintMarginPercent': instance.maintMarginPercent,
      'requiredMarginPercent': instance.requiredMarginPercent,
      'baseAsset': instance.baseAsset,
      'quoteAsset': instance.quoteAsset,
      'marginAsset': instance.marginAsset,
      'pricePrecision': instance.pricePrecision,
      'quantityPrecision': instance.quantityPrecision,
      'baseAssetPrecision': instance.baseAssetPrecision,
      'quotePrecision': instance.quotePrecision,
      'underlyingType': instance.underlyingType,
      'underlyingSubType': instance.underlyingSubType,
      'settlePlan': instance.settlePlan,
      'triggerProtect': instance.triggerProtect,
      'liquidationFee': instance.liquidationFee,
      'marketTakeBound': instance.marketTakeBound,
      'maxMoveOrderLimit': instance.maxMoveOrderLimit,
      'filters': instance.filters,
      'orderTypes': instance.orderTypes,
      'timeInForce': instance.timeInForce,
    };
