import 'package:flutter/material.dart';

// ListView & List Tile
class PageList extends StatelessWidget {
  const PageList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 15,
        scrollDirection: Axis.vertical,
        itemBuilder: (_, index) {
          return ListTile(
            tileColor: Colors.green[index * 100],
            title: const Text('ini Title'),
            subtitle: const Text('ini Sub title'),
            leading: const Icon(Icons.favorite),
            trailing: const Icon(Icons.star),
          );
        },
      ),
    );
  }
}
