import 'package:dartz/dartz.dart';

import '../../data/model/models.dart';

abstract class PairsUseCase {
  Future<Either<Error, List<PairSymbol>>> requestPairs();
}
