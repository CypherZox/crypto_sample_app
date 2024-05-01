import 'package:crypto_app/crypto_pairs/data/local/favourites_local_data_source_impl.dart';
import 'package:crypto_app/crypto_pairs/data/model/pair_symbol.dart';
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
    final result = mockFavoritesLocal.getFavorites();
    expect(pairsSample, result);
  });
}
