import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superio_assignment/features/cart/controller/cart_controller.dart';

import '../../../../data/model/cart_model.dart';

class AddRemoveButton extends StatelessWidget {
  AddRemoveButton({super.key, required this.screenHeight, required this.screenWidth, required this.menu});

  final double screenHeight;
  final double screenWidth;
  Menu menu;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      alignment: Alignment.center,
      height: screenHeight * 0.03,
      width: screenWidth * 0.2,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), border: Border.all(color: Colors.yellow)),
      child: GetBuilder<CartController>(
        builder: (controller) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
                onTap: () {
                  controller.removeProduct(menu);
                },
                child: const Icon(
                  Icons.remove,
                  size: 15,
                  color: Colors.black,
                )),
            Text('${controller.items.where((element) => menu.id == element.menu.id).firstOrNull?.quantity ?? 0}'),
            InkWell(
              onTap: () {
                controller.addProduct(menu);
              },
              child: const Icon(
                Icons.add,
                size: 15,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}