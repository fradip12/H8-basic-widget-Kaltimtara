import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:session_one/config/app_router.dart';
import 'package:session_one/pages/page_detail_resto.dart';
import 'package:session_one/pages/page_json.dart';

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
      // routes: {
      //   '/': (context) => const PageJSON(),
      //   '/detail': (context) => const PageRestoDetail(),
      // },
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: '/',
      // home: const PageJSON(),
    );
  }
}
