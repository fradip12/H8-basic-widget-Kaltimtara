import 'package:flutter/material.dart';
import 'package:session_one/controller/resto_provider.dart';
import 'package:session_one/models/recipes_model.dart';
import 'package:session_one/services/api_services.dart';

class RecipesProvider extends ChangeNotifier {
  List<RecipesModel>? data = [];
  ApiStatus state = ApiStatus.idle;
  RecipesModel? selectedData;

  void addFavorite(RecipesModel item) {
    data?.firstWhere((element) => element == item).isFavorite = true;
    notifyListeners();
  }

  void removeFavorite(RecipesModel item) {
    data?.firstWhere((element) => element == item).isFavorite = false;
    notifyListeners();
  }

  void selectData(RecipesModel data) {
    selectedData = data;
    notifyListeners();
  }

  void getData() async {
    // Loading
    state = ApiStatus.loading;
    notifyListeners();

    // Process Get API
    getRecipes().then((value) {
      // If Success
      data = value;
      state = ApiStatus.success;
      notifyListeners();
    }).catchError((err) {
      // If Error
      debugPrint(err);
      state = ApiStatus.error;
      notifyListeners();
    });
  }
}
