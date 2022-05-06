import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/themes_providers.dart';

class TopHome extends StatefulWidget {
  const TopHome({Key? key}) : super(key: key);

  @override
  State<TopHome> createState() => _TopHomeState();
}

class _TopHomeState extends State<TopHome> {
  @override
  Widget build(BuildContext context) {
//
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;
//
    return Container(
      height: size.height * 0.2,
      width: size.width,
      decoration: BoxDecoration(
          color: (themeProvider.themeMode == ThemeMode.light)
              ? Color.fromARGB(255, 94, 244, 121)
              : Colors.blueGrey,
          image: const DecorationImage(
              image: AssetImage("assets/images/graphL1.png"),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(size.width, 90),
          )),
      child: Stack(children: [
        Positioned(
          top: 10,
          left: 10,
          child: Row(
            children: [
              const Text("CryptoMix",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
              IconButton(
                  onPressed: () {
                    themeProvider.toggleTheme();
                  },
                  padding: const EdgeInsets.all(0),
                  icon: (themeProvider.themeMode == ThemeMode.light)
                      ? const Icon(Icons.dark_mode)
                      : const Icon(Icons.light_mode)),
            ],
          ),
        ),
      ]),
    );
  }
}
