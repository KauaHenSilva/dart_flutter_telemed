import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:telemed/screens/backend/auth.dart';
import 'package:telemed/screens/backend/perfil_bend.dart';
import 'package:telemed/screens/backend/save_page.dart';
import 'package:telemed/screens/favoriteScreen/favorite_page.dart';
import 'package:telemed/screens/home/home_navigation.dart';
import 'package:telemed/screens/introScreen/init_page.dart';
import 'package:telemed/screens/login_cadastro/cadastro.dart';
import 'package:telemed/screens/login_cadastro/login.dart';
import 'package:telemed/screens/login_cadastro/perfil_page.dart';
import 'package:telemed/screens/notificationScreen/notification_screen.dart';
import 'package:telemed/utils/my_routes.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

Widget paginaInicial(String? route) {
  FirebaseAuth auth = FirebaseAuth.instance;

  NavigationState().clearCurrentRoute();

  User? cliente = auth.currentUser;

  if (route != null) {
    return const PerfilPage();
  } else {
    if (cliente != null) {
      return const HomePrincipal();
    } else {
      return const Login();
    }
  }
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<String?> _initialRoute;
  String? rota;

  @override
  void initState() {
    super.initState();
    _initialRoute = NavigationState().getCurrentRoute();
    _initialRoute.then((value) {
      setState(() {
        rota = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => Perfilbend(),
        ),
        Provider(
          create: (_) => Auth(),
        ),
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [Locale('pt', 'BR')],
        debugShowCheckedModeBanner: false,
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
        initialRoute: MyRoutes.welcome,
        routes: {
          MyRoutes.welcome: (ctx) => const InitPage(),
          MyRoutes.home: (ctx) => paginaInicial(rota),
          MyRoutes.cadastro: (ctx) => const Cadastro(),
          MyRoutes.login: (ctx) => const Login(),
          MyRoutes.perfil: (ctx) => const PerfilPage(),
          MyRoutes.homeprincipal: (ctx) => const HomePrincipal(),
          MyRoutes.favorite: (ctx) => const FavoritePage(),
          MyRoutes.notification: (ctx) => const NotificationScreen(),
        },
      ),
    );
  }
}
