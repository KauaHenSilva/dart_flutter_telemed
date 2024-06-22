import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telemed/screens/home_page.dart';
import 'package:telemed/screens/introScreen/init_page.dart';
import 'package:telemed/screens/introScreen/welcome_page.dart';
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
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF242733),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF242733)),
        textTheme: GoogleFonts.nunitoTextTheme().copyWith(
          displayLarge: GoogleFonts.orelegaOne(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          displayMedium: GoogleFonts.nunito(
            fontSize: 20,
            color: Colors.white,
          ),
          displaySmall: GoogleFonts.nunito(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
      routes: {
        MyRoutes.welcome: (ctx) => const WelcomePage(),
        MyRoutes.init: (ctx) => const InitPage(),
        MyRoutes.home: (ctx) => const HomePage(),
      },
    );
  }
}
