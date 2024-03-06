import 'package:flutter/material.dart';

class PageButton extends StatelessWidget {
  const PageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FadeInImage.assetNetwork(
          fadeInDuration: const Duration(seconds: 3),
          fadeOutDuration: const Duration(seconds: 3),
          placeholder: 'assets/600x400.png',
          image:
              'https://fastly.picsum.photos/id/349/200/300.jpg?hmac=gEjHZbjuKtdD2GOM-qQtuaA95TCvDUs6iVvKraQ94nU',
        ),
      ),
    );
  }
}
