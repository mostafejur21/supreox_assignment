import 'package:get/get.dart';
import 'package:superio_assignment/features/cart/controller/cart_controller.dart';

class CartBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(() => CartController());
  }
}