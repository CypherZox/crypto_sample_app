import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../data/model/models.dart';
import '../repository/repository.dart';
import 'use_case.dart';

@Injectable(as: PairsUseCase)
class PairsUseCaseImpl implements PairsUseCase {
  PairsUseCaseImpl(this._pairsRepo);

  final PairsRepo _pairsRepo;

  @override
  Future<Either<Error, List<PairSymbol>>> requestPairs() =>
      _pairsRepo.requestPairs();
}
