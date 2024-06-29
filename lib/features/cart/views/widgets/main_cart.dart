import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../../data/model/cart_model.dart';
import '../../controller/cart_controller.dart';
import 'add_remove_button.dart';

class MainCart extends StatelessWidget {
  const MainCart({
    super.key,
    required this.controllerCart,
    required this.screenHeight,
    required this.screenWidth,
  });

  final CartController controllerCart;
  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Menu>?>(
      future: controllerCart.getItems(),
      builder: (context, snapshot) {
        if (snapshot.connectionState ==
            ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error fetching data'));
        } else if (snapshot.hasData) {
          List<Menu> items = snapshot.data!;

          return ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var itemData = items[index];
              return ListTile(
                title: Text(
                  "${itemData.name}",
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text('${itemData.description}'),
                trailing: Column(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '\$${itemData.price}',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    GetBuilder<CartController>(
                      builder: (controller) {
                        var quantity = controller.items
                            .where((ex) =>
                        itemData.id == ex.menu.id)
                            .singleOrNull
                            ?.quantity ??
                            0;

                        return quantity == 0
                            ? InkWell(
                          onTap: () {
                            controller
                                .addProduct(itemData);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: screenHeight * 0.03,
                            width: screenWidth * 0.15,
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(
                                  2),
                              border: Border.all(
                                  color: Colors.orange),
                            ),
                            child: const Text('Add'),
                          ),
                        )
                            : AddRemoveButton(
                          screenHeight: screenHeight,
                          screenWidth: screenWidth,
                          menu: itemData,
                        );
                      },
                    ),
                  ],
                ),
                leading: DottedBorder(
                  color: Colors.orange,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(12),
                  child: Container(
                    height: screenHeight * .15,
                    width: screenWidth * .15,
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.1),
                      border: Border.all(color: Colors.yellow),
                    ),
                    child: CircleAvatar(
                      backgroundImage:
                      NetworkImage('${itemData.image}'),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) =>
                SizedBox(height: screenHeight * .02),
            itemCount: items.length,
          );
        } else {
          return Container(); // Placeholder for empty state or fallback
        }
      },
    );
  }
}