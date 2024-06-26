import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:telemed/screens/backend/auth.dart';
import 'package:telemed/screens/backend/perfil_bend.dart';
import 'package:telemed/screens/home/home_navigation.dart';
import 'package:telemed/screens/login_cadastro/cadastro.dart';
import 'package:telemed/screens/login_cadastro/login.dart';
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

Widget paginaInicial() {
	FirebaseAuth auth = FirebaseAuth.instance;

	User? cliente = auth.currentUser;

	if(cliente != null){
		return HomePrincipal(
			cliente.email
		);
	}else{
		return const Login();
	}
}

class MyApp extends StatelessWidget {
	const MyApp({super.key});

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
				supportedLocales: const [
					Locale('pt', 'BR'), // Português Brasileiro
				],
				debugShowCheckedModeBanner: false,
				title: 'App',
				theme: ThemeData.light(),
				darkTheme: ThemeData.dark(),
				routes: {
					MyRoutes.home: (ctx) => paginaInicial(),
					// MyRoutes.home: (ctx) => const Login(),
					MyRoutes.cadastro : (ctx) => const Cadastro(),
					MyRoutes.login : (ctx) => const Login(),
				},
			),
		);
	}
}