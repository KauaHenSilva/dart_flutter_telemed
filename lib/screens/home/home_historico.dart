import 'package:flutter/material.dart';

class HomeHistorico extends StatefulWidget {
  const HomeHistorico({super.key});

  @override
  State<HomeHistorico> createState() => _HomeHistoricoState();
}

class _HomeHistoricoState extends State<HomeHistorico> {
	
  @override
  Widget build(BuildContext context) {
    return const Center(
		child:Text(
			"Histórico"
		),
	);
  }
}