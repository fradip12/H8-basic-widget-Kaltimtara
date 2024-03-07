import 'package:flutter/material.dart';
import 'package:session_one/models/restaurant_models.dart';

class RestoProvider extends ChangeNotifier {
  // Variable untuk streaming resto
  RestaurantModels? selectedResto;
  List<Menu> cart = [];
  Map<RestaurantModels, List<Menu>> cart2 = {};

  // Action untuk select resto
  void selectResto(RestaurantModels data) {
    selectedResto = data;
    notifyListeners();
  }

  void addProduct(Menu product) {
    cart.add(product);
    notifyListeners();
    debugPrint(cart.toString());
  }
}
