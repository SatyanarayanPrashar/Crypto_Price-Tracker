import 'package:coin_mix/widgets/cryptoListTile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/CryptoCurrency.dart';
import 'Details.dart';
import '../providers/marketProvider.dart';

class MarketList extends StatefulWidget {
  const MarketList({Key? key}) : super(key: key);

  @override
  State<MarketList> createState() => _MarketListState();
}

class _MarketListState extends State<MarketList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<MarketProvider>(
      builder: (context, marketProvider, child) {
        if (marketProvider.isLoading == true) {
          return const Center(child: CircularProgressIndicator());
        } else {
          if (marketProvider.markets.length > 0) {
            return RefreshIndicator(
              onRefresh: () async {
                await marketProvider.fetchData();
              },
              child: ListView.builder(
                  padding: const EdgeInsets.only(
                      top: 0, left: 20, right: 20, bottom: 0),
                  physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics()),
                  itemCount: marketProvider.markets.length,
                  itemBuilder: (context, index) {
                    CryptoCurrency currentCrypto =
                        marketProvider.markets[index];
//
                    return CryptoListTile(currentCrypto: currentCrypto);
                  }),
            );
          } else {
            return const Text("Data not Found!");
          }
        }
      },
    );
  }
}
