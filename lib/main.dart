import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:telemed/screens/favoriteScreen/favorite_page.dart';
import 'package:telemed/screens/home_page.dart';
import 'package:telemed/screens/introScreen/init_page.dart';
import 'package:telemed/screens/introScreen/welcome_page.dart';
import 'package:telemed/screens/notificationScreen/notification_screen.dart';
import 'package:telemed/utils/my_routes.dart';

void main() async {

	WidgetsFlutterBinding.ensureInitialized();
	
	await Firebase.initializeApp(
		options: DefaultFirebaseOptions.currentPlatform,
	);

  	runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF242733),
        canvasColor: const Color(0xFFD9D9D9),
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
        MyRoutes.favorite: (ctx) => const FavoritePage(),
        MyRoutes.notification: (ctx) => const NotificationScreen(),
      },
    );
  }
}
