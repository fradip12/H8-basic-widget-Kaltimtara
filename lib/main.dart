import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:session_one/config/app_router.dart';
import 'package:session_one/controller/login_controller.dart';
import 'package:session_one/controller/qr_controller.dart';
import 'package:session_one/controller/recipes_controller.dart';
import 'package:session_one/controller/resto_provider.dart';
import 'package:session_one/pages/page_nfc.dart';

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
      // onGenerateRoute: AppRouter.onGenerateRoute,
      // initialRoute: '/',
      home: const PageNFC(),
    );
  }
}
