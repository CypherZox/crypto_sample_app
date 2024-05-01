import 'dart:convert';

import 'package:crypto_app/price_updates/data/model/price_update.dart';
import 'package:crypto_app/price_updates/presentation/bloc/price_update_event.dart';
import 'package:crypto_app/price_updates/presentation/bloc/price_update_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/price_update_use_case.dart';

@Injectable()
class PriceUpdateBloc extends Bloc<PriceUpdateEvent, PriceUpdateState> {
  final PriceUpdateUseCase _priceUpdateUseCase;

  PriceUpdateBloc(this._priceUpdateUseCase) : super(PriceInitialState()) {
    on<SubscribeToStreamEvent>((event, emit) async {
      await emit.forEach(_priceUpdateUseCase.subscribeToPriceUpdates(),
          onData: (data) {
        final List<PriceUpdate> priceList = json
            .decode(data)
            .map<PriceUpdate>((update) => PriceUpdate.fromJson(update))
            .toList();
        return PriceUpdatedState(priceList);
      });
    });
  }
}
