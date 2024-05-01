import 'package:crypto_app/price_updates/domain/usecases/price_update_use_case.dart';
import 'package:injectable/injectable.dart';

import '../../data/remote/source/price_update_web_socket.dart';

@Injectable(as: PriceUpdateUseCase)
class PriceUpdateUseCaseImpl implements PriceUpdateUseCase {
  final WebSocketDataSource _webSocketDataSource;

  PriceUpdateUseCaseImpl(this._webSocketDataSource);

  @override
  Stream<dynamic> subscribeToPriceUpdates() {
    return _webSocketDataSource.subscribeToChannel();
  }
}
