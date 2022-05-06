import 'package:coin_mix/models/CryptoCurrency.dart';
import 'package:coin_mix/providers/marketProvider.dart';
import 'package:coin_mix/widgets/cryptoListTile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteList extends StatefulWidget {
  const FavoriteList({Key? key}) : super(key: key);

  @override
  State<FavoriteList> createState() => _FavoriteListState();
}

class _FavoriteListState extends State<FavoriteList> {
  @override
  Widget build(BuildContext context) {
    //
    return Consumer<MarketProvider>(builder: (context, marketProvider, child) {
      //
      List<CryptoCurrency> favorites = marketProvider.markets
          .where((element) => element.isFavorite == true)
          .toList();
      //
      if (favorites.length > 0) {
        return ListView.builder(
            itemCount: favorites.length,
            itemBuilder: ((context, index) {
//
              CryptoCurrency currentCrypto = favorites[index];
              return CryptoListTile(currentCrypto: currentCrypto);
//
            }));
      } else {
        return Center(
            child: Text("No Favorites yet",
                style: TextStyle(color: Colors.grey, fontSize: 20)));
      }

      //
    });
    // Container(child: Text("favorites will show up here"));
  }
}
