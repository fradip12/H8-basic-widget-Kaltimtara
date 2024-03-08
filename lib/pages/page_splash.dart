import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:session_one/services/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    checkToken();
  }

  void checkToken() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('tokenKey');

    if (token == null) {
      if (mounted) {
        Navigator.pushNamed(context, '/login');
      }
    } else {
      ApiServices.rootApi(token).then((value) {
        if (value) {
          Navigator.pushNamed(context, '/homepage');
        } else {
          Navigator.pushNamed(context, '/login');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 75,
        ),
      ),
    );
  }
}
