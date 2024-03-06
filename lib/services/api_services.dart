import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:session_one/models/restaurant_models.dart';

Future<List<RestaurantModels>> getDataRestaurant() async {
  // Seolah olah GET API DARI BACKEND
  final jsonData = await rootBundle.loadString('assets/json/data.json');

  // Decode menjadi List<dynamic>
  final jsonDecoded = json.decode(jsonData) as List;
  // Convert dari Map<String,dynamic> -> RestaurantModels
  final dataBersih = jsonDecoded.map((e) => RestaurantModels.fromJson(e));

  await Future.delayed(Duration(seconds: 3));
  // dataBersih -> List
  return dataBersih.toList();
}
