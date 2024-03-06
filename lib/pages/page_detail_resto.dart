import 'package:flutter/material.dart';
import 'package:session_one/models/restaurant_models.dart';

class PageRestoDetail extends StatelessWidget {
  final RestaurantModels arguments;
  const PageRestoDetail({super.key, required this.arguments});

  @override
  Widget build(BuildContext context) {
    // final arguments =
    //     ModalRoute.of(context)?.settings.arguments as RestaurantModels;

    return Scaffold(
      appBar: AppBar(
        title: Text(arguments.name ?? '-'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            ListView.builder(
              primary: true,
              shrinkWrap: true,
              itemCount: arguments.menus?.length,
              itemBuilder: (_, index) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(arguments.menus?[index].menu ?? '-'),
                    Text('Rp. ${arguments.menus?[index].price ?? '0'}'),
                  ],
                );
              },
            ),
            // Expanded(
            //   child: Row(
            //     children: List.generate(
            //       arguments.rating == '-'
            //           ? 0
            //           : double.parse(arguments.rating ?? '0') ~/ 1,
            //       (index) => Icon(
            //         Icons.star,
            //         color: Colors.orangeAccent,
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
