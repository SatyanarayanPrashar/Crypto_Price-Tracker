import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/CryptoCurrency.dart';

class TopTitleDetails extends StatelessWidget {
  const TopTitleDetails({
    Key? key,
    required this.currentCrypto,
  }) : super(key: key);

  final CryptoCurrency currentCrypto;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      // padding: const EdgeInsets.all(11),
      height: size.height * 0.1,
      // color: Colors.yellow,
//
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: size.width * 0.04,
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(currentCrypto.image!),
          ),
          SizedBox(
            width: size.width * 0.04,
          ),
//
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                currentCrypto.name!,
                style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic),
              ),
              Text(
                "(" + currentCrypto.symbol!.toUpperCase() + ")",
                style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.italic),
              ),
              Text(
                "₹ " + currentCrypto.currentPrice!.toStringAsFixed(4),
                style: const TextStyle(
                    color: Color.fromARGB(255, 0, 174, 248),
                    fontWeight: FontWeight.w600,
                    fontSize: 20),
              ),
            ],
          )
        ],
      ),
    );
  }
}
