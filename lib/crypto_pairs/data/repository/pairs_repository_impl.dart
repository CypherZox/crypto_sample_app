import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/repository.dart';
import '../model/models.dart';
import '../remote/service/services.dart';

@Injectable(as: PairsRepo)
class PairsRepoImpl implements PairsRepo {
  PairsRepoImpl(this._pairsRequest);

  final PairsRequest _pairsRequest;
  @override
  Future<Either<Error, List<PairSymbol>>> requestPairs() async {
    try {
      final List<PairSymbol> symbols = await _pairsRequest.fetchPairs();
      return right(symbols);
    } catch (e) {
      return left(Error());
    }
  }
}
