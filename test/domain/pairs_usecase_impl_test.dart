import 'package:crypto_app/crypto_pairs/data/model/models.dart';
import 'package:crypto_app/crypto_pairs/domain/repository/repository.dart';
import 'package:crypto_app/crypto_pairs/domain/usecase/use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPairsRepo extends Mock implements PairsRepo {}

void main() {
  late MockPairsRepo mockPairsRepo;
  late final List<PairSymbol> pairSymbols = <PairSymbol>[
    PairSymbol(
        symbol: 'BTCUSDT',
        pair: 'BTCUSDT',
        baseAsset: 'BTC',
        quoteAsset: 'USDT')
  ];

  setUp(() {
    mockPairsRepo = MockPairsRepo();
  });

  test('when requestPairs is called it should return a list of pair symbols',
      () async {
    when(() => mockPairsRepo.requestPairs())
        .thenAnswer((_) async => right(pairSymbols));
    final PairsUseCaseImpl pairsUseCase = PairsUseCaseImpl(mockPairsRepo);

    final Either<Error, List<PairSymbol>> response =
        await pairsUseCase.requestPairs();
    final List<PairSymbol> actualList = response.getOrElse(() => []);
    expect(actualList, equals(pairSymbols));
  });
}
