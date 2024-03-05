import 'package:flutter/material.dart';

class PageGrid extends StatelessWidget {
  const PageGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 300),
        itemBuilder: (_, index) {
          return Container(
            margin: const EdgeInsets.all(8.0),
            color: Colors.blue,
            alignment: Alignment.center,
            child: const Text('Product'),
          );
        },
      ),
    );
  }
}
