import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:session_one/config/app_router.dart';
import 'package:session_one/controller/qr_controller.dart';
import 'package:session_one/controller/recipes_controller.dart';
import 'package:session_one/controller/resto_provider.dart';
import 'package:session_one/pages/page_detail_resto.dart';
import 'package:session_one/pages/page_json.dart';
import 'package:session_one/pages/pages_qr_codes.dart';

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RestoProvider()),
        ChangeNotifierProvider(create: (context) => RecipesProvider()),
        ChangeNotifierProvider(create: (context) => QRProvider()),

        // ChangeNotifierProvider(create: (context) => RestoProvider()),
        // etc. provider
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // onGenerateRoute: AppRouter.onGenerateRoute,
        // initialRoute: '/',
        home: const QRCodesScanner(),
      ),
    );
  }
}
