import 'package:flutter/material.dart';

class HomePerfil extends StatefulWidget {
  const HomePerfil({super.key});

  @override
  State<HomePerfil> createState() => _HomePerfilState();
}

class _HomePerfilState extends State<HomePerfil> {
  @override
  Widget build(BuildContext context) {
    return const Center(
    	child: Text(
			"Perfil"
		)
    );
  }
}