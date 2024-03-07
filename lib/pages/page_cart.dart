import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:session_one/controller/resto_provider.dart';

class PageCart extends StatelessWidget {
  const PageCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Keranjang'),
      ),
      body: Consumer<RestoProvider>(
        builder: (_, data, __) {
          return ListView.builder(
            itemCount: data.cart.length,
            itemBuilder: (_, index) {
              return Text(data.cart[index].menu ?? '-');
            },
          );
        },
      ),
    );
  }
}
