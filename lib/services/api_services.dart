import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/services.dart';
import 'package:session_one/models/recipes_model.dart';
import 'package:session_one/models/restaurant_models.dart';

Future<List<RestaurantModels>> getDataRestaurant() async {
  // Seolah olah GET API DARI BACKEND
  final jsonData = await rootBundle.loadString('assets/json/data.json');

  // Decode menjadi List<dynamic>
  final jsonDecoded = json.decode(jsonData) as List;
  // Convert dari Map<String,dynamic> -> RestaurantModels
  final dataBersih = jsonDecoded.map((e) => RestaurantModels.fromJson(e));

  // Seolah olah waiting from backend
  // await Future.delayed(const Duration(seconds: 3));
  // dataBersih -> List
  return dataBersih.toList();
}

Future<List<RecipesModel>> getRecipes() async {
  const String url = 'https://dummyjson.com/recipes';
  final response = await http.get(Uri.parse(url));
  final extractedData = json.decode(response.body)['recipes'] as List<dynamic>;
  final data = extractedData.map((e) => RecipesModel.fromJson(e)).toList();
  return data;
}
