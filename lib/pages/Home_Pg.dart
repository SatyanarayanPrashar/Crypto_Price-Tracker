import 'package:coin_mix/models/CryptoCurrency.dart';
import 'package:coin_mix/pages/Details.dart';
import 'package:coin_mix/providers/marketProvider.dart';
import 'package:coin_mix/providers/themes_providers.dart';
import 'package:coin_mix/pages/FavoriteList.dart';
import 'package:coin_mix/widgets/TopHomeImaage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'MarketList.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController listController;

  @override
  void initState() {
    super.initState();
    listController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopHome(),

//
//
              TabBar(controller: listController, tabs: [
                Tab(
                  child: Text(
                    "Markets",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                Tab(
                  child: Text("Favorites",
                      style: Theme.of(context).textTheme.bodyText1),
                )
              ]),

              Expanded(
                child: TabBarView(
                    physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()),
                    controller: listController,
                    children: const [
                      MarketList(),
                      FavoriteList(),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
