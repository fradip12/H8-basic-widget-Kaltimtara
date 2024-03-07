import 'package:flutter/material.dart';
import 'package:session_one/models/restaurant_models.dart';
import 'package:session_one/pages/page_cart.dart';
import 'package:session_one/pages/page_detail_resto.dart';
import 'package:session_one/pages/page_json.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings route) {
    switch (route.name) {
      case '/':
        return MaterialPageRoute(builder: (context) => const PageJSON());
      case '/detail':
        return MaterialPageRoute(
          builder: (context) => PageRestoDetail(
              // arguments: route.arguments as RestaurantModels,
              ),
        );
      case '/cart':
        return MaterialPageRoute(builder: (context) => PageCart());
      default:
        return MaterialPageRoute(builder: (context) => Container());
    }
  }
}
