import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:telemed/screens/backend/auth.dart';
import 'package:telemed/screens/backend/perfil.dart';
import 'package:telemed/screens/backend/perfil_bend.dart';
import 'package:telemed/screens/home/home_agendamento.dart';
import 'package:telemed/screens/home/home_artigo.dart';
import 'package:telemed/screens/home/home_historico.dart';
import 'package:telemed/screens/home/home_page.dart';
import 'package:telemed/screens/home/home_perfil.dart';
import 'package:telemed/utils/my_routes.dart';

class HomePrincipal extends StatefulWidget {

	const HomePrincipal(
		{super.key}
	);

  	@override
  	State<HomePrincipal> createState() => _HomePrincipalState();
}

class _HomePrincipalState extends State<HomePrincipal> {
	var _indexTela = 0;
	
	String? textDay;
	String? nomeP = '';

	String retornaHora(){
		final data = DateTime.now();

		if(data.hour >= 6 && data.hour <= 12){
			return 'Bom dia👋';
		}else if(data.hour >= 12 && data.hour <= 18){
			return 'Boa Tarde👋';
		}else if(data.hour >= 0 && data.hour <= 6){
			return 'Boa Madrugada👋';
		}else{
			return 'Boa Noite👋';
		}

	}

	Future<String> namePerfil() async {
		List<Perfil> lista = await Perfilbend().recebePerfil();
		FirebaseAuth auth = FirebaseAuth.instance;

		for(int i=0;i < lista.length;i++){
			if(lista[i].email == auth.currentUser!.email){
				return lista[i].apelido;
			}
		}

		return '';
	}

	void colocaPerfil()  async {
		final nameT = await namePerfil();
		
		if(mounted){
			setState(() {
				nomeP = nameT;
			});
		}
	}

	@override
	void initState(){
		super.initState();
		
		textDay = retornaHora();
		colocaPerfil();
	}

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
						Row(
							children: [
								const CircleAvatar(
									backgroundColor: Color.fromARGB(255, 100, 100, 100),
								),
								const Padding(padding: EdgeInsets.only(left: 8)),
								Column(
									children: <Widget>[
										Text(
											textDay!,
											style: const TextStyle(
												fontSize: 15
											),
											textAlign: TextAlign.center,
										),
										Text(
											nomeP!,
											style: const TextStyle(
												fontSize: 15,
												fontWeight: FontWeight.w600,
												color: Colors.white
											),
											textAlign: TextAlign.center,
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
								IconButton(
									onPressed: (){
										FirebaseAuth auth = FirebaseAuth.instance;

										Auth().sair(auth);

										Navigator.of(context).pushReplacementNamed(
											MyRoutes.login
										);
									}, 
									icon: const Icon(Icons.login_outlined)
								)
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