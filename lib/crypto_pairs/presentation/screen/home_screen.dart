import 'package:crypto_app/crypto_pairs/presentation/widget/search_field.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../config/app_setup.dart';
import '../../data/model/models.dart';
import '../bloc/bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final PairsBloc _pairsBloc;
  late final PriceUpdateBloc _priceUpdateBloc;
  late final SearchPairsBloc _searchPairsBloc;
  late final FavoritePairBloc _favoritePairBloc;

  @override
  void initState() {
    super.initState();
    initiateBlocs();
  }

  initiateBlocs() {
    _pairsBloc = getIt<PairsBloc>();
    _priceUpdateBloc = getIt<PriceUpdateBloc>();
    _searchPairsBloc = getIt<SearchPairsBloc>();
    _favoritePairBloc = getIt<FavoritePairBloc>();

    _priceUpdateBloc.add(const SubscribeToStreamEvent());
    _pairsBloc.add(const FetchPairsEvent());
    _favoritePairBloc.add(const GetFavoritePairsEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<PriceUpdateBloc>(
            create: (BuildContext context) => _priceUpdateBloc,
          ),
          BlocProvider<SearchPairsBloc>(
            create: (BuildContext context) => _searchPairsBloc,
          ),
          BlocProvider<PairsBloc>(
            create: (BuildContext context) => _pairsBloc,
          ),
          BlocProvider<FavoritePairBloc>(
            create: (BuildContext context) => _favoritePairBloc,
          ),
        ],
        child: BlocBuilder<FavoritePairBloc, FavoritePairState>(
            builder: (context, favoriteState) {
          if (favoriteState is FavoritePairsLoadingState) {
            return Column(
              children: [
                const Text('Loading ...'),
                Center(
                  child: Lottie.asset('assets/loading.json'),
                ),
              ],
            );
          }
          return BlocBuilder<PriceUpdateBloc, PriceUpdateState>(
              builder: (context, pState) {
            if (pState is PriceUpdatedState) {
              return BlocBuilder<SearchPairsBloc, SearchPairState>(
                  builder: (BuildContext context, SearchPairState searchState) {
                return BlocBuilder<PairsBloc, PairSymbolState>(
                  builder: (BuildContext context, PairSymbolState state) {
                    if (state is PairsLoadingState ||
                        state is PairsInitialState) {
                      return Column(
                        children: [
                          const Text('Loading ...'),
                          Center(
                            child: Lottie.asset('assets/loading.json'),
                          ),
                        ],
                      );
                    }
                    if (state is PairsLoadedState) {
                      return SafeArea(
                        bottom: false,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(16, 32, 16, 0),
                                child: SearchTextField(
                                  resetSearch: () {
                                    _searchPairsBloc
                                        .add(const SearchResetEvent());
                                  },
                                  onChanged: (v) {
                                    _searchPairsBloc
                                        .add(SearchPairsEvent(v, state.pairs));
                                    if (v == '') {
                                      _searchPairsBloc
                                          .add(const SearchResetEvent());
                                    }
                                  },
                                ),
                              ),
                              if (searchState is PairsSearchResultState)
                                _listOfPairs(searchState.pairs, context,
                                    pState.priceUpdate, favoriteState),
                              if (favoriteState is FavoritesPairsLoadedState &&
                                  favoriteState.pairs.isNotEmpty) ...[
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(24, 8, 0, 0),
                                  child: Text(
                                    'Favorites',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                _listOfPairs(favoriteState.pairs, context,
                                    pState.priceUpdate, favoriteState),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(24, 0, 24, 0),
                                  child: Divider(
                                    color: Colors.grey.withOpacity(0.2),
                                  ),
                                )
                              ],
                              _listOfPairs(state.visiblePairs, context,
                                  pState.priceUpdate, favoriteState),
                              state.visiblePairs.length != state.pairs.length &&
                                      searchState is InitialSearchState
                                  ? TextButton(
                                      onPressed: () {
                                        _pairsBloc
                                            .add(const LoadNextPairsEvent());
                                      },
                                      child: const Text(
                                        'Load More',
                                        style: TextStyle(color: Colors.blue),
                                      ))
                                  : const SizedBox(
                                      height: 23,
                                    ),
                            ],
                          ),
                        ),
                      );
                    }
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Loading ...'),
                        Center(
                          child: Lottie.asset('assets/loading.json'),
                        ),
                      ],
                    );
                  },
                );
              });
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Loading ...'),
                Center(
                  child: Lottie.asset('assets/loading.json'),
                ),
              ],
            );
          });
        }),
      ),
    );
  }

  _listOfPairs(List<PairSymbol> pairs, BuildContext context,
      List<PriceUpdate> priceUpdates, FavoritePairState favoritePairState) {
    return ListView.builder(
        itemCount: pairs.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.zero,
        physics: const ScrollPhysics(),
        itemBuilder: (context, index) {
          bool isFavorite = (favoritePairState is FavoritesPairsLoadedState) &&
              favoritePairState.pairs
                  .map((e) => e.pair)
                  .toList()
                  .contains(pairs[index].pair);
          return Card(
            elevation: 2,
            margin: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 4, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(pairs[index].baseAsset.toString()),
                      const SizedBox(
                        width: 34,
                      ),
                      Text(pairs[index].pair.toString()),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            if (isFavorite) {
                              _favoritePairBloc.add(
                                  DeleteFromFavoritesPairsEvent(pairs[index]));
                            } else {
                              _favoritePairBloc
                                  .add(AddToFavoritesPairsEvent(pairs[index]));
                            }
                          },
                          icon: Icon(
                            Icons.star,
                            color: isFavorite ? Colors.amber : Colors.grey,
                          ))
                    ],
                  ),
                  Text(
                      _mapPairsWithPrices(pairs[index], priceUpdates).markPrice)
                ],
              ),
            ),
          );
        });
  }

  PriceUpdate _mapPairsWithPrices(
      PairSymbol pair, List<PriceUpdate> priceUpdates) {
    return priceUpdates
        .where((update) => update.symbol == pair.symbol)
        .toList()
        .first;
  }
}
