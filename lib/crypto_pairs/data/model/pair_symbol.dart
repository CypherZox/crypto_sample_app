import 'package:json_annotation/json_annotation.dart';

part 'pair_symbol.g.dart';

@JsonSerializable()
class Filter {
  String? maxPrice;
  String? minPrice;
  String? tickSize;
  String? minQty;
  String? maxQty;
  String? stepSize;
  int? limit;
  String? notional;
  String? multiplierUp;
  String? multiplierDown;
  String? multiplierDecimal;
  String? filterType;

  Filter({
    this.maxPrice,
    this.minPrice,
    this.tickSize,
    this.minQty,
    this.maxQty,
    this.stepSize,
    this.limit,
    this.notional,
    this.multiplierUp,
    this.multiplierDown,
    this.multiplierDecimal,
    this.filterType,
  });

  factory Filter.fromJson(Map<String, dynamic> json) => _$FilterFromJson(json);

  Map<String, dynamic> toJson() => _$FilterToJson(this);
}

@JsonSerializable()
class PairSymbol {
  String? symbol;
  String? pair;
  String? contractType;
  int? deliveryDate;
  int? onboardDate;
  String? status;
  String? maintMarginPercent;
  String? requiredMarginPercent;
  String? baseAsset;
  String? quoteAsset;
  String? marginAsset;
  int? pricePrecision;
  int? quantityPrecision;
  int? baseAssetPrecision;
  int? quotePrecision;
  String? underlyingType;
  List<String>? underlyingSubType;
  int? settlePlan;
  String? triggerProtect;
  String? liquidationFee;
  String? marketTakeBound;
  int? maxMoveOrderLimit;
  List<Filter>? filters;
  List<String>? orderTypes;
  List<String>? timeInForce;

  PairSymbol({
    this.symbol,
    this.pair,
    this.contractType,
    this.deliveryDate,
    this.onboardDate,
    this.status,
    this.maintMarginPercent,
    this.requiredMarginPercent,
    this.baseAsset,
    this.quoteAsset,
    this.marginAsset,
    this.pricePrecision,
    this.quantityPrecision,
    this.baseAssetPrecision,
    this.quotePrecision,
    this.underlyingType,
    this.underlyingSubType,
    this.settlePlan,
    this.triggerProtect,
    this.liquidationFee,
    this.marketTakeBound,
    this.maxMoveOrderLimit,
    this.filters,
    this.orderTypes,
    this.timeInForce,
  });

  factory PairSymbol.fromJson(Map<String, dynamic> json) =>
      _$PairSymbolFromJson(json);

  Map<String, dynamic> toJson() => _$PairSymbolToJson(this);
}
