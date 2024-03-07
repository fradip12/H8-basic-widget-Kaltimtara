import 'package:flutter/material.dart';
import 'package:session_one/models/restaurant_models.dart';
import 'package:session_one/services/api_services.dart';

class RestoProvider extends ChangeNotifier {
  // Variable untuk streaming resto
  RestaurantModels? selectedResto;
  List<Menu> cart = [];
  // Data untuk list resto
  List<RestaurantModels>? listResto;

  // Status untuk process get API
  ApiStatus state = ApiStatus.idle;

  void getDataResto() async {
    //Assign Loading
    state = ApiStatus.loading;
    notifyListeners();

    // Simulation Delay
    await Future.delayed(Duration(seconds: 3));

    // Get restaurant
    getDataRestaurant().then((value) {
      // Assign ke variable streamer
      listResto = value;
      state = ApiStatus.success;
      notifyListeners(); // Wajib Listener
    });
  }

  // Action untuk select resto
  void selectResto(RestaurantModels data) {
    selectedResto = data;
    notifyListeners();
  }

  void addProduct(Menu product) {
    cart.add(product);
    notifyListeners();
  }

  void addFavorite(RestaurantModels resto) {
    listResto?.firstWhere((element) => element == resto).setFavorite = true;
    notifyListeners();
  }

  void removeFavorite(RestaurantModels resto) {
    listResto?.firstWhere((element) => element == resto).setFavorite = false;
    notifyListeners();
  }
}

enum ApiStatus {
  idle,
  loading,
  success,
  error;
}
