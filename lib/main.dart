import 'package:flutter/material.dart';
import 'package:telemed/screens/home_page.dart';
import 'package:telemed/utils/my_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      routes: {
        MyRoutes.home: (ctx) => const HomePage()
      },
    );
  }
}
