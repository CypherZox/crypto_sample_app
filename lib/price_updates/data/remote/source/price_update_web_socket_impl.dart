import 'package:crypto_app/price_updates/data/remote/source/price_update_web_socket.dart';
import 'package:injectable/injectable.dart';
import 'package:web_socket_channel/io.dart';

@Injectable(as: WebSocketDataSource)
class BinanceWebSocketDataSource implements WebSocketDataSource {
  @override
  Stream<dynamic> subscribeToChannel() {
    final channel = IOWebSocketChannel.connect(
        'wss://fstream.binance.com/ws/!markPrice@arr');
    return channel.stream;
  }
}
