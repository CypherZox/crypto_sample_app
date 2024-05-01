// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i4;

import '../core/local_data/shared_pref_registration.dart' as _i23;
import '../crypto_pairs/data/local/favourites_local_data_source.dart' as _i12;
import '../crypto_pairs/data/local/favourites_local_data_source_impl.dart'
    as _i6;
import '../crypto_pairs/data/remote/service/get_pairs_service.dart' as _i3;
import '../crypto_pairs/data/remote/service/services.dart' as _i11;
import '../crypto_pairs/data/repository/favorites_repository_impl.dart' as _i17;
import '../crypto_pairs/data/repository/pairs_repository_impl.dart' as _i10;
import '../crypto_pairs/domain/repository/repository.dart' as _i9;
import '../crypto_pairs/domain/usecase/favorites_usecase.dart' as _i19;
import '../crypto_pairs/domain/usecase/favorites_usecase_impl.dart' as _i20;
import '../crypto_pairs/domain/usecase/pairs_usecase_impl.dart' as _i16;
import '../crypto_pairs/domain/usecase/use_case.dart' as _i15;
import '../crypto_pairs/presentation/bloc/favorites_bloc/favorites_bloc.dart'
    as _i22;
import '../crypto_pairs/presentation/bloc/pair_symbol_bloc.dart' as _i21;
import '../crypto_pairs_search/presentation/bloc/search_pair_bloc.dart' as _i5;
import '../price_updates/data/remote/source/price_update_web_socket.dart'
    as _i7;
import '../price_updates/data/remote/source/price_update_web_socket_impl.dart'
    as _i8;
import '../price_updates/domain/usecases/price_update_use_case.dart' as _i13;
import '../price_updates/domain/usecases/price_update_use_case_impl.dart'
    as _i14;
import '../price_updates/presentation/bloc/price_updat_bloc.dart' as _i18;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final registerModule = _$RegisterModule();
  gh.factory<_i3.PairsRequest>(() => _i3.PairsRequest());
  await gh.factoryAsync<_i4.SharedPreferences>(
    () => registerModule.sharedPreferences,
    preResolve: true,
  );
  gh.factory<_i5.SearchPairsBloc>(() => _i5.SearchPairsBloc());
  gh.lazySingleton<_i6.FavoritesLocalDataSourceImpl>(
      () => registerModule.favoritesLocalDataSource);
  gh.factory<_i7.WebSocketDataSource>(() => _i8.BinanceWebSocketDataSource());
  gh.factory<_i9.PairsRepo>(() => _i10.PairsRepoImpl(gh<_i11.PairsRequest>()));
  gh.factory<_i12.FavoritesLocalDataSource>(() =>
      _i6.FavoritesLocalDataSourceImpl(
          sharedPreferences: gh<_i4.SharedPreferences>()));
  gh.factory<_i13.PriceUpdateUseCase>(
      () => _i14.PriceUpdateUseCaseImpl(gh<_i7.WebSocketDataSource>()));
  gh.factory<_i15.PairsUseCase>(
      () => _i16.PairsUseCaseImpl(gh<_i9.PairsRepo>()));
  gh.factory<_i9.FavoritesRepo>(
      () => _i17.FavoritesRepoImpl(gh<_i12.FavoritesLocalDataSource>()));
  gh.factory<_i18.PriceUpdateBloc>(
      () => _i18.PriceUpdateBloc(gh<_i13.PriceUpdateUseCase>()));
  gh.factory<_i19.FavoritesUseCase>(
      () => _i20.FavoritesUseCaseImpl(gh<_i9.FavoritesRepo>()));
  gh.factory<_i21.PairsBloc>(() => _i21.PairsBloc(gh<_i15.PairsUseCase>()));
  gh.factory<_i22.FavoritePairBloc>(
      () => _i22.FavoritePairBloc(gh<_i19.FavoritesUseCase>()));
  return getIt;
}

class _$RegisterModule extends _i23.RegisterModule {}
