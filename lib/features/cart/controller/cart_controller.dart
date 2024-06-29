import 'dart:convert';

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:superio_assignment/data/model/cart_model.dart';
import 'package:superio_assignment/data/services/network_caller.dart';
import 'package:superio_assignment/data/services/network_response.dart';

class CartController extends GetxController {
  var isLoading = false.obs;
  var menu = <Menu>[].obs;
  List<Items> items = [];
  var vat = 0.obs;
  var totalPrice = 0.obs;
  var subTotalPrice = 0.obs;

  Future<RxList<Menu>?> getItems () async {
    isLoading.value = true;
    var response = await NetworkCaller.get();
    var data = json.decode(response);
    if(data != null && data != ''){
      for(var item in data['menu']){
        menu.add(Menu.fromJson(item));
      }
      isLoading.value = false;
    update();
    return menu;
    } else {
      return null;
    }
  }

  addProduct(Menu item){
    var pro = items.where((element) => item.id == element.menu.id).toList();
    if(pro.isNotEmpty){
      pro[0].quantity += 1;
    } else {
      items.add(Items(menu: item, quantity: 1));
    }
    calculateTotalPrice();
    update();
  }

  removeProduct(Menu item){
    var pro = items.where((element) => item.id == element.menu.id).toList();
    if(pro.isNotEmpty){
      if(pro[0].quantity > 1){
        pro[0].quantity -= 1;
      } else {
        items.remove(pro[0]);
      }
    }
    calculateTotalPrice();
    update();
  }
  void calculateTotalPrice() {
    for(var item in items){
      subTotalPrice.value += item.menu.price! * item.quantity;
    }
    vat.value = (subTotalPrice.value * 0.10).toInt();
    totalPrice.value = subTotalPrice.value + vat.value;
  }

}