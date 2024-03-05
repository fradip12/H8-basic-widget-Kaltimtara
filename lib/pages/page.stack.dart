import 'package:flutter/material.dart';

class PageStack extends StatelessWidget {
  const PageStack({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              width: 150,
              height: 150,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Colors.blue,
                    Colors.red,
                    Colors.yellow,
                  ],
                ),
                borderRadius: BorderRadius.circular(150),
                border: Border.all(
                  color: Colors.black,
                  width: 5.0,
                ),
              ),
            ),
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(35),
              ),
              alignment: Alignment.center,
              child: const Text(
                '1',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
