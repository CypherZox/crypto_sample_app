import 'package:dartz/dartz.dart';

import '../../data/model/models.dart';

abstract class PairsRepo {
  Future<Either<Error, List<PairSymbol>>> requestPairs();
}
