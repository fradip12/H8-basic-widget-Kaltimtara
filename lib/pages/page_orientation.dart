import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PageOrientation extends StatefulWidget {
  const PageOrientation({super.key});

  @override
  State<PageOrientation> createState() => _PageOrientationState();
}

class _PageOrientationState extends State<PageOrientation> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (_, orientation) {
          return Center(
            child: ElevatedButton(
              onPressed: () {
                if (orientation == Orientation.landscape) {
                  SystemChrome.setPreferredOrientations([
                    DeviceOrientation.portraitDown,
                    DeviceOrientation.portraitUp,
                  ]);
                } else {
                  SystemChrome.setPreferredOrientations([
                    DeviceOrientation.landscapeLeft,
                    DeviceOrientation.landscapeRight,
                  ]);
                }
              },
              child: Text('Change Orientation'),
            ),
          );
        },
      ),
    );
  }
}
