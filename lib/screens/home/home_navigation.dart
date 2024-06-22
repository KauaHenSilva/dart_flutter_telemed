import 'package:flutter/material.dart';
import 'package:telemed/screens/home/home_agendamento.dart';
import 'package:telemed/screens/home/home_artigo.dart';
import 'package:telemed/screens/home/home_historico.dart';
import 'package:telemed/screens/home/home_page.dart';
import 'package:telemed/screens/home/home_perfil.dart';

class HomePrincipal extends StatefulWidget {
  const HomePrincipal({super.key});

  @override
  State<HomePrincipal> createState() => _HomePrincipalState();
}

class _HomePrincipalState extends State<HomePrincipal> {
	var _indexTela = 0;
  
	@override
	
	Widget build(BuildContext context) {
		var telas = [
			const HomePage(),
			const HomeAgendamento(),
			const HomeHistorico(),
			const HomeArtigo(),
			const HomePerfil()
		];
		return Scaffold(
			backgroundColor: const Color.fromARGB(255,36,39,51),
			appBar: AppBar(
				automaticallyImplyLeading: false,
				forceMaterialTransparency: true,
				title: Row(
					mainAxisAlignment: MainAxisAlignment.spaceBetween,
					children: <Widget>[
						const Row(
							children: [
								CircleAvatar(
									backgroundColor: Color.fromARGB(255, 100, 100, 100),
								),
								Padding(padding: EdgeInsets.only(left: 8)),
								Column(
									children: <Widget>[
										Text(
											"Bom dia!",
											style: TextStyle(
												fontSize: 15
											),
										),
										Text(
											"Antonio Sales",
											style: TextStyle(
												fontSize: 15
											),
										)
									],
								),
							],
						),
						Row(
							children: [
								IconButton(
									onPressed: (){
										
									}, 
									icon: const Icon(Icons.notifications)
								),
								IconButton(
									onPressed: (){
										
									}, 
									icon: const Icon(Icons.favorite)
								),
							],
						)
					],
				),
			),
			body: Container(
				padding: const EdgeInsets.all(15),
				child: telas[_indexTela],
			),
			bottomNavigationBar: Column(
				mainAxisSize: MainAxisSize.min,
				children: [
					const Divider(
						height: 1,
						color: Color.fromARGB(255,79,79,79),
					),
					BottomNavigationBar(
						backgroundColor: const Color.fromARGB(255,36,39,51),
						currentIndex: _indexTela,
						onTap: (index){
							setState(() {
							_indexTela = index;
							});
						},
						type: BottomNavigationBarType.fixed,
						selectedItemColor: const Color.fromARGB(255, 0,4,213),
						unselectedItemColor: const Color.fromARGB(255,79,79,79),
						showSelectedLabels: false,
						showUnselectedLabels: false,
						iconSize: 35.0,
						items: const [
							BottomNavigationBarItem(
								icon: Icon(Icons.home),
								label: 'Principal'
							),
							BottomNavigationBarItem(
								icon: Icon(Icons.calendar_month_outlined),
								label: 'Agendamento'
							),
							BottomNavigationBarItem(
								icon: Icon(Icons.aod_outlined),
								label: 'Histórico'
							),
							BottomNavigationBarItem(
								icon: Icon(Icons.subject_outlined),
								label: 'Artigos'
							),
							BottomNavigationBarItem(
								icon: Icon(Icons.person),
								label: 'Perfil'
							),
						],
					),
				]
			),
		);
	}
}