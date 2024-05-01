import 'dart:convert';

import 'package:crypto_app/common/constants.dart';
import 'package:crypto_app/crypto_pairs/data/local/favourites_local_data_source.dart';
import 'package:crypto_app/crypto_pairs/data/model/pair_symbol.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Injectable(as: FavoritesLocalDataSource)
class FavoritesLocalDataSourceImpl implements FavoritesLocalDataSource {
  final SharedPreferences sharedPreferences;

  FavoritesLocalDataSourceImpl({required this.sharedPreferences});
  @override
  List<PairSymbol> getFavorites() {
    try {
      final favoritesMap = sharedPreferences.getStringList(favoritesKey);
      if (favoritesMap != null) {
        final List<PairSymbol> result = favoritesMap
            .map((map) => PairSymbol.fromJson(json.decode(map)))
            .toList();
        return result;
      } else {
        final Error error = Error();
        throw error;
      }
    } catch (e) {
      final Error error = Error();
      throw error;
    }
  }

  @override
  Future<bool> addToFavorite(PairSymbol asset) async {
    final favoritesMap = sharedPreferences.getStringList(favoritesKey) ?? [];
    if (favoritesMap.isNotEmpty &&
        !favoritesMap.contains(json.encode(asset.toJson()))) {
      favoritesMap.add(json.encode(asset.toJson()));
      return await sharedPreferences.setStringList(favoritesKey, favoritesMap);
    } else if (favoritesMap.isEmpty) {
      return await sharedPreferences
          .setStringList(favoritesKey, [json.encode(asset.toJson())]);
    } else {
      return true;
    }
  }

  @override
  Future<bool> deleteFavorite(PairSymbol asset) async {
    final favoritesMap = sharedPreferences.getStringList(favoritesKey) ?? [];
    if (favoritesMap.isNotEmpty) {
      favoritesMap.remove(json.encode(asset.toJson()));
      return await sharedPreferences.setStringList(favoritesKey, favoritesMap);
    } else {
      return await sharedPreferences
          .setStringList(favoritesKey, [json.encode(asset.toJson())]);
    }
  }
}
