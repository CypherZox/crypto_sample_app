import 'package:crypto_app/crypto_pairs/data/model/models.dart';
import 'package:crypto_app/crypto_pairs/data/remote/service/services.dart';
import 'package:crypto_app/crypto_pairs/data/repository/repository_impl.dart';
import 'package:dartz/dartz.dart';
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

  test('when requestPairs is called it should return a list of pair symbols',
      () async {
    when(() => mockPairsRequest.fetchPairs())
        .thenAnswer((_) async => pairSymbols);
    final PairsRepoImpl pairsRepoImp = PairsRepoImpl(mockPairsRequest);

    final Either<Error, List<PairSymbol>> response =
        await pairsRepoImp.requestPairs();
    final List<PairSymbol> actualList = response.getOrElse(() => []);
    expect(actualList, equals(pairSymbols));
  });
}
