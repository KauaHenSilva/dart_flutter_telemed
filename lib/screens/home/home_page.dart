import 'package:flutter/material.dart';
import 'package:telemed/screens/home/components/botoes_especialidade.dart';
import 'package:telemed/screens/home/components/botoes_medicos.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
	
  	@override
	Widget build(BuildContext context) {
		return Column(
			crossAxisAlignment: CrossAxisAlignment.start,
			children: [
				TextField(
					cursorColor: const Color.fromARGB(255, 255, 255, 255),
					keyboardType: TextInputType.none,
					decoration: InputDecoration(
						filled: true,
						fillColor: const Color.fromARGB(255, 56, 56, 56),
						border: const OutlineInputBorder(
							borderRadius: BorderRadius.all(
								Radius.circular(10)
							)
						),
						enabledBorder: const OutlineInputBorder(
							borderSide: BorderSide(
								color: Color.fromARGB(255, 59, 103, 215)
							),
							borderRadius: BorderRadius.all(
								Radius.circular(10)
							)
						),
						focusedBorder: const OutlineInputBorder(
							borderSide: BorderSide(
								color: Color.fromARGB(255, 59, 103, 215)
							),
						),
						prefixIcon: const Icon(Icons.search),
						prefixIconColor: Colors.white,
						suffixIcon: IconButton(
							onPressed: (){

							}, 
							icon: const Icon(Icons.format_list_bulleted_rounded)
						),
						suffixIconColor: const Color.fromARGB(255, 59, 103, 215),
						hintText: "Procurar",
						hintStyle: const TextStyle(
							color: Colors.white
						)
					)
				),
				const Padding(padding: EdgeInsets.only(top: 10)),
				ClipRRect(
					borderRadius: const BorderRadius.all(
						Radius.circular(25)
					),
					child: Container(
						color: const Color.fromARGB(255, 73, 113, 217),
						child: Row(
							mainAxisAlignment: MainAxisAlignment.spaceBetween,
							children: [
								const Padding(
									padding: EdgeInsets.only(left: 5),
									child: Column(
										crossAxisAlignment: CrossAxisAlignment.start,
										children: [
											Text(
												"Exames Médicos!",
												style: TextStyle(
													color: Colors.white
												),
											),
											Padding(padding: EdgeInsets.only(top: 5)),
											Text(
												"Verifique seu estado de\nsaúde regularmente para\nminimizar a incidência de\ndoenças no futuro.",
												style: TextStyle(
													color: Colors.white
												),
											)
										]
									),
								),
								Container(
									height: 165,
									width: 150,
									decoration: const BoxDecoration(
										image: DecorationImage(
											image: AssetImage(
												"assets/images/medico.png"
											),
											fit: BoxFit.cover
										)
									),
								)
							],
						),
					),
				),
				const Padding(padding: EdgeInsets.only(top: 10)),
				const Text(
					"Especialidade Médica"
				),
				const Padding(padding: EdgeInsets.only(top: 10)),
				Row(
					mainAxisAlignment: MainAxisAlignment.spaceBetween,
					children: [
						Column(
							mainAxisAlignment: MainAxisAlignment.spaceBetween,
							children: [
								GestureDetector(
									onTap: (){
										print("Em geral");
									},
									child: const ButtonHome(
										name: "Em geral",
										caminho: "assets/icons/em_geral.png",
										paddingButton: EdgeInsets.only(top: 3,right: 5),
									)
								),
								const Padding(padding: EdgeInsets.only(top: 10)),
								GestureDetector(
									onTap: (){
										print("Pediatrico");
									},
									child: const ButtonHome(
										name: "Pediátrico",
										caminho: "assets/icons/pediatrico.png",
										paddingButton: EdgeInsets.only(top: 5,right: 5),
									)
								),
							]
						),
						Column(
							children: [
								GestureDetector(
									onTap: (){
										print("Dentista");
									},
									child: const ButtonHome(
										name: "Dentista",
										caminho: "assets/icons/dentista.png",
										paddingButton: EdgeInsets.only(top: 4,right: 4),
									)
								),
								const Padding(padding: EdgeInsets.only(top: 10)),
								GestureDetector(
									onTap: (){
										print("Neurologista");
									},
									child: const ButtonHome(
										name: "Neurologista",
										caminho: "assets/icons/neurologista.png",
										paddingButton: EdgeInsets.only(top: 4,right: 5),
									)
								),
							]
						),
						Column(
							mainAxisAlignment: MainAxisAlignment.spaceBetween,
							children: [
								GestureDetector(
									onTap: (){
										print("Oftamologista");
									},
									child: const ButtonHome(
										name: "Oftalmológico",
										caminho: "assets/icons/oftamologista.png",
										paddingButton: EdgeInsets.only(top: 6,right: 5),
									)
								),
								const Padding(padding: EdgeInsets.only(top: 10)),
								GestureDetector(
									onTap: (){
										print("Farmaceutico");
									},
									child: const ButtonHome(
										name: "Farmacêutico",
										caminho: "assets/icons/farmaceutico.png",
										paddingButton: EdgeInsets.only(top: 5,right: 4),
									)
								),
							]
						),
						Column(
							mainAxisAlignment: MainAxisAlignment.spaceBetween,
							children: [
								GestureDetector(
									onTap: (){
										print("Nutrição");
									},
									child: const ButtonHome(
										name: "Nutrição",
										caminho: "assets/icons/nutricao.png",
										paddingButton: EdgeInsets.only(top: 4,right: 4),
									)
								),
								const Padding(padding: EdgeInsets.only(top: 10)),
								GestureDetector(
									onTap: (){
										print("Mais");
									},
									child: const ButtonHome(
										name: "Mais...",
										caminho: "assets/icons/mais.png",
										paddingButton: EdgeInsets.only(top: 6,right: 6),
									)
								),
							]
						),
					],
				),
				const Padding(padding: EdgeInsets.only(top: 15)),
				Row(
					mainAxisAlignment: MainAxisAlignment.spaceBetween,
					children: [
						const Text(
							"Melhores Médicos"
						),
						TextButton(
							onPressed: (){

							}, 
							child: const Text(
								"Ver Tudo",
								style: TextStyle(
									color: Colors.white
								),
							)
						)
					],
				),
				
				const Padding(padding: EdgeInsets.only(top: 10)),
				
				SingleChildScrollView(
					scrollDirection: Axis.horizontal,
					child:  Row(
						children: [
							ButtonMedicos(
								name: "Todos",
								onPressed: (){
									print("Todos");
								},
							),
							ButtonMedicos(
								name: "Em Geral",
								onPressed: (){
									print("Em Geral");
								},
							),
							ButtonMedicos(
								name: "Dentista",
								onPressed: (){
									print("Dentista");
								},
							),
							ButtonMedicos(
								name: "Nutricionista",
								onPressed: (){
									print("Nutricionista");
								},
							)
						],
					)
				)
			],
		);
	}
}