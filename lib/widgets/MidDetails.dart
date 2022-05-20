import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/CryptoCurrency.dart';
import '../providers/themes_providers.dart';

class MidDetails extends StatelessWidget {
  const MidDetails({
    Key? key,
    required this.currentCrypto,
    required this.cryptoDetails,
    required this.detailName,
  }) : super(key: key);

  final CryptoCurrency currentCrypto;
  final String cryptoDetails;
  final String detailName;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.07,
      width: size.width * 0.92,
      decoration: BoxDecoration(
          border: Border.all(
              color: (themeProvider.themeMode == ThemeMode.light)
                  ? Colors.black.withOpacity(0.1)
                  : Colors.white.withOpacity(0.1)),
          borderRadius: const BorderRadius.all(Radius.circular(17))),
//
//
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              detailName,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              cryptoDetails,
              style: const TextStyle(
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
