import 'package:flutter/material.dart';
import 'package:telemed/screens/login_cadastro/cadastro.dart';
import 'package:telemed/screens/login_cadastro/login.dart';
import 'package:telemed/screens/login_cadastro/perfil.dart';
import 'package:telemed/utils/my_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
	const MyApp({super.key});

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,
			title: 'App',
			theme: ThemeData.light(),
			darkTheme: ThemeData.dark(),
			routes: {
				MyRoutes.home: (ctx) => const Login(),
				MyRoutes.cadastro : (ctx) => const Cadastro(),
				MyRoutes.login : (ctx) => const Login(),
				MyRoutes.perfil : (ctx) => const Perfil(),
			},
		);
	}
}
