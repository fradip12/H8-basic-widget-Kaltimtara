import 'package:flutter/material.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          children: [
            Container(
              width: 25,
              height: 25,
              color: Colors.blue[800],
            ),
            Container(
              width: 25,
              height: 25,
              color: Colors.blue[700],
            ),
            Container(
              width: 25,
              height: 25,
              color: Colors.blue[600],
            ),
            Container(
              width: 25,
              height: 25,
              color: Colors.blue[400],
            ),
            Container(
              width: 25,
              height: 25,
              color: Colors.blue[200],
            ),
            Container(
              width: 25,
              height: 25,
              color: Colors.blue[100],
            ),
          ],
        ),
      ),
    );
  }
}
