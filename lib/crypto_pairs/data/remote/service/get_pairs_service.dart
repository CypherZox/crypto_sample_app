import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

import '../../model/models.dart';

@Injectable()
class PairsRequest {
  Future<List<PairSymbol>> fetchPairs() async {
    http.Response response = await http
        .get(Uri.parse('https://www.binance.com/fapi/v1/exchangeInfo'));

    final symbolMaps = (jsonDecode(response.body))['symbols'];
    final value = symbolMaps
        .map<PairSymbol>((symbolMap) => PairSymbol.fromJson(symbolMap))
        .toList();

    return value;
  }
}
