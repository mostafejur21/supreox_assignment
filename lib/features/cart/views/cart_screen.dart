import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:superio_assignment/features/cart/controller/cart_controller.dart';
import 'package:superio_assignment/features/cart/views/widgets/cart_container.dart';
import 'package:superio_assignment/features/cart/views/widgets/main_cart.dart';
import 'package:superio_assignment/features/cart/views/widgets/price_text.dart';

class AddToCartScreen extends StatelessWidget {
  const AddToCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Responsive Height and Width
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final controllerCart = Get.find<CartController>();

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Container(
          height: screenHeight * .20,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Colors.orange.withOpacity(0.2)),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: GetBuilder<CartController>(
              builder: (controller) => Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ItemPriceText(
                    titleText: 'Subtotal',
                    priceText: '${controller.subTotalPrice.value}',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Vat(5%) Service Charge included (5%)',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          )),
                      Text('\$${controller.vat.value}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          )),
                    ],
                  ),
                  const Divider(
                    color: Colors.orange,
                  ),
                  ItemPriceText(priceText: controller.totalPrice.toString(), titleText: 'Total')
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    CartContainer(screenHeight: screenHeight),
                    MainCart(controllerCart: controllerCart, screenHeight: screenHeight, screenWidth: screenWidth),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}








