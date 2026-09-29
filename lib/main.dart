import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/themes/theme.dart';
import 'package:news_app/utilis/bloc_observer.dart';
import 'package:news_app/view/screens/datils_screen.dart';
import 'package:news_app/view/screens/home_screen.dart';
import 'package:news_app/view/screens/splash_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      initialRoute: 'splash',
      routes: {
        'home': (context) => const HomeScreen(),
        'details': (context) => const DetailsScreen(),
        'splash': (context) => const SplashScreen(),
      },
    );
  }
}
