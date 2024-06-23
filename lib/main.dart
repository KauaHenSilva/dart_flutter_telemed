import 'package:flutter/material.dart';
import 'package:telemed/screens/home_page.dart';
import 'package:telemed/utils/my_routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        MyRoutes.home: (ctx) => const HomePage(),
      },
    );
  }
}
