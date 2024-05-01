import 'package:crypto_app/crypto_pairs/data/local/favourites_local_data_source_impl.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/app_setup.dart';

@module
abstract class RegisterModule {
  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();

  @lazySingleton
  FavoritesLocalDataSourceImpl get favoritesLocalDataSource =>
      FavoritesLocalDataSourceImpl(
        sharedPreferences: getIt<SharedPreferences>(),
      );
}
