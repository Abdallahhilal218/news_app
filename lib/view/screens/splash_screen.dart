import 'package:flutter/material.dart';
import 'package:news_app/core/app_routes/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacementNamed(AppRoutes.home);
          },
          child: const Text('Go to Home'),
        ),
      ),
    );
  }
}
