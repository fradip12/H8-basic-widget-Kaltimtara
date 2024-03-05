import 'package:flutter/material.dart';
import 'package:session_one/pages/page.stack.dart';
import 'package:session_one/pages/page_grid.dart';
import 'package:session_one/pages/page_list.dart';
import 'package:session_one/pages/page_two.dart';

import 'pages/page_one.dart';

void main() {
  runApp(const MyApp());
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
      home: const PageGrid(),
    );
  }
}
