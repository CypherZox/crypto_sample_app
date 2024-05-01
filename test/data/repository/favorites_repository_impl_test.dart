import 'dart:js_util';

import 'package:crypto_app/crypto_pairs/data/local/favourites_local_data_source_impl.dart';
import 'package:crypto_app/crypto_pairs/data/model/models.dart';
import 'package:crypto_app/crypto_pairs/data/repository/favorites_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class FavoritesLocalDataSourceImplMock extends Mock
    implements FavoritesLocalDataSourceImpl {}

void main() {
  late FavoritesLocalDataSourceImplMock mockFavoritesLocal;
  late final List<PairSymbol> pairsSample = <PairSymbol>[
    PairSymbol(
        symbol: 'BTCUSDT',
        pair: 'BTCUSDT',
        baseAsset: 'BTC',
        quoteAsset: 'USDT')
  ];

  setUp(() {
    mockFavoritesLocal = FavoritesLocalDataSourceImplMock();
  });

  test('get favorites should return a list of pairs', () async {
    when(() => mockFavoritesLocal.getFavorites())
        .thenAnswer((_) => pairsSample);
    final FavoritesRepoImpl favoritesRepo =
        FavoritesRepoImpl(mockFavoritesLocal);

    final Either<Error, List<PairSymbol>> result = favoritesRepo.getFavorites();

    final List<PairSymbol> actualList = result.getOrElse(() => []);

    expect(actualList, equals(pairsSample));
  });
}
