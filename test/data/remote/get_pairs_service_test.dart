import 'package:crypto_app/crypto_pairs/data/model/models.dart';
import 'package:crypto_app/crypto_pairs/data/remote/service/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPairsRequest extends Mock implements PairsRequest {}

void main() {
  late MockPairsRequest mockPairsRequest;
  late final List<PairSymbol> pairSymbols = <PairSymbol>[
    PairSymbol(
        symbol: 'BTCUSDT',
        pair: 'BTCUSDT',
        baseAsset: 'BTC',
        quoteAsset: 'USDT')
  ];

  setUp(() {
    mockPairsRequest = MockPairsRequest();
  });

  test('when getPairs is called it should return a list of Pairs', () async {
    when(() => mockPairsRequest.fetchPairs())
        .thenAnswer((_) async => pairSymbols);
    final List<PairSymbol> response = await mockPairsRequest.fetchPairs();
    expect(response, pairSymbols);
  });
}
