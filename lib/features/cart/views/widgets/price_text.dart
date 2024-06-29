import 'package:flutter/material.dart';

class ItemPriceText extends StatelessWidget {
  String titleText;
  String priceText;
  ItemPriceText({
    required this.priceText,
    required this.titleText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          titleText,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        Text('\$$priceText',
            style: const TextStyle(
              color: Colors.orange,
              fontSize: 20,
            )),
      ],
    );
  }
}