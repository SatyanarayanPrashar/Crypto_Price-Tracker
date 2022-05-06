import 'package:coin_mix/models/CryptoCurrency.dart';
import 'package:coin_mix/providers/marketProvider.dart';
import 'package:coin_mix/providers/themes_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/MidDetails.dart';
import '../widgets/TopTitleDetails.dart';

class DetailsPage extends StatefulWidget {
  final String id;

  const DetailsPage({Key? key, required this.id}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  get children => null;

  @override
  Widget build(BuildContext context) {
//

    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
//
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(),
        body: SafeArea(child: Container(
          child: Consumer<MarketProvider>(
              builder: (context, marketProvider, child) {
//
            CryptoCurrency currentCrypto =
                marketProvider.fetchCryptoById(widget.id);
//
            return RefreshIndicator(
              onRefresh: () async {
                await marketProvider.fetchData();
              },
              child: ListView(
                physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics()),
                children: [
//
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
//
                      children: [
                        //
                        TopTitleDetails(currentCrypto: currentCrypto),
                        //
                        const SizedBox(
                          height: 15,
                        ),
//
                        SizedBox(
                          // margin: EdgeInsets.fromLTRB(10, 0, 10, 10),
                          height: size.height * 0.1,
                          width: size.width * 0.9,
                          // decoration: BoxDecoration(color: Colors.yellow),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Price Change (24h)",
                                style: TextStyle(
                                    fontSize: 21, fontWeight: FontWeight.w500),
                              ),
                              Builder(builder: (context) {
                                double priceChange =
                                    currentCrypto.priceChange24!;
                                double priceChangePercentage =
                                    currentCrypto.priceChangePercentage24!;

                                if (priceChange < 0) {
                                  // Negative
                                  return Text(
                                    "${priceChangePercentage.toStringAsFixed(2)}% (${priceChange.toStringAsFixed(4)})",
                                    style: const TextStyle(
                                        fontSize: 27, color: Colors.red),
                                  );
                                } else {
                                  //positive
                                  return Text(
                                    "+${priceChangePercentage.toStringAsFixed(2)}% (+${priceChange.toStringAsFixed(4)})",
                                    style: const TextStyle(
                                        fontSize: 27, color: Colors.green),
                                  );
                                }
                              })
                            ],
                          ),
                        ),
//
                        MidDetails(
                          currentCrypto: currentCrypto,
                          cryptoDetails:
                              "₹ " + currentCrypto.marketCap.toString(),
                          detailName: "Market Cap:",
                        ),
//
                        const SizedBox(height: 7),
//
                        MidDetails(
                          currentCrypto: currentCrypto,
                          cryptoDetails: "₹ " + currentCrypto.high24.toString(),
                          detailName: "High 24:",
                        ),
//
                        const SizedBox(height: 7),
//
                        MidDetails(
                          currentCrypto: currentCrypto,
                          cryptoDetails: "₹ " + currentCrypto.low24.toString(),
                          detailName: "Low 24h:",
                        ),
//
                        const SizedBox(height: 7),
//
                        MidDetails(
                          currentCrypto: currentCrypto,
                          cryptoDetails: currentCrypto.circulatingSupply!
                              .toStringAsFixed(0),
                          detailName: "Circulating Suppy:",
                        ),
//
                        const SizedBox(height: 7),
//
                        MidDetails(
                          currentCrypto: currentCrypto,
                          cryptoDetails:
                              "₹ " + currentCrypto.ath!.toStringAsFixed(4),
                          detailName: "All time high:",
                        ),
//
                        const SizedBox(height: 7),
//
                        MidDetails(
                          currentCrypto: currentCrypto,
                          cryptoDetails:
                              "₹ " + currentCrypto.atl!.toStringAsFixed(4),
                          detailName: "All time low:",
                        ),
//
                      ],
                    ),
                  )
//
                ],
              ),
            );
          }),
        )));
  }
}
