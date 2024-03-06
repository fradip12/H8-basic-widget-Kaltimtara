import 'package:flutter/material.dart';
import 'package:session_one/models/restaurant_models.dart';
import 'package:session_one/services/api_services.dart';

class PageJSON extends StatelessWidget {
  const PageJSON({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<RestaurantModels>>(
          future: getDataRestaurant(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (_, index) {
                  print('snapshot.data');
                  print(snapshot.data?[index].name);
                  return Text(snapshot.data?[index].name ?? '-');
                },
              );
            }
            return Text('GET DATA RESTAURANT');
          },
        ),
      ),
    );
  }
}
