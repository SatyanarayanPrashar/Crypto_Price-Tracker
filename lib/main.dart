import 'package:coin_mix/constants/themes.dart';
import 'package:coin_mix/pages/Home_Pg.dart';
import 'package:coin_mix/providers/marketProvider.dart';
import 'package:coin_mix/providers/themes_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/LocalStorage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  String currentTheme = await LocalStorage.getTheme() ?? "light";

  runApp(MyApp(
    theme: currentTheme,
  ));
}

class MyApp extends StatelessWidget {
  final String theme;

  MyApp({required this.theme});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MarketProvider>(
          create: (context) => MarketProvider(),
        ),
        // ....
        ChangeNotifierProvider<ThemeProvider>(
            create: (context) => ThemeProvider(theme)),

        // ....
      ],
      child: Consumer<ThemeProvider>(builder: (context, ThemeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeProvider.themeMode,
          theme: lightTheme,
          darkTheme: darkTheme,
          home: HomePage(),
        );
      }),
    );
  }
}
