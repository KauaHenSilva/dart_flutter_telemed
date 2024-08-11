import 'package:flutter/material.dart';

class HomeAgendamento extends StatefulWidget {
  const HomeAgendamento({super.key});

  @override
  State<HomeAgendamento> createState() => _HomeAgendamentoState();
}

class _HomeAgendamentoState extends State<HomeAgendamento> {
  @override
  Widget build(BuildContext context) {
    return const Center(
		child:Text(
			"Agendamento"
		),
	);
  }
}