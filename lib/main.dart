import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:session_one/pages/page_button.dart';
import 'package:session_one/pages/page_json.dart';
import 'package:session_one/pages/page_one.dart';
import 'package:session_one/pages/page_orientation.dart';
import 'package:session_one/pages/page_snackbar.dart';

void main() {
  runApp(const MyApp());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('');
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PageJSON(),
    );
  }
}
