import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:telemed/utils/my_routes.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
	bool? _ocult = true;
	IconData iconSenha = Icons.visibility_off;

  	@override

  	Widget build(BuildContext context) {
		final mediaQuery = MediaQuery.of(context);
		final sizeTop = mediaQuery.size.height;
		final sizeWidth = mediaQuery.size.width;

		return Scaffold(
			backgroundColor: const Color.fromARGB(255,36,39,51),
			body: SingleChildScrollView(
				padding: EdgeInsets.only(top: sizeTop * 0.1,left: sizeWidth * 0.05,right: sizeWidth * 0.05),
				child: Column(
					children: [
						Image.asset(
							"assets/images/login.png",
							width: 224,
							height: sizeTop * 0.23,
						),
						const Text(
							"Criar Uma Nova Conta",
							style: TextStyle(
								fontSize: 30,
							),
						),
						Padding(
							padding: const EdgeInsets.only(top: 10),
								child:  Column(
									children: [
										const TextField(
											decoration: InputDecoration(
												filled: true,
												fillColor: Color.fromARGB(255, 47,51,68),
												border: OutlineInputBorder(
													borderRadius: BorderRadius.all(Radius.circular(10.0)),
												),
												enabledBorder: OutlineInputBorder(
													borderSide:BorderSide(
														color: Color.fromARGB(255, 47,51,68)
													)
												),
												focusedBorder: OutlineInputBorder(
													borderSide:BorderSide(
														color: Color.fromARGB(255, 47,51,68)
													)
												),
												prefixIcon: Icon(Icons.email),
												prefixIconColor: Color.fromARGB(255, 20,57,190),
												labelText: "E-mail",
											),
											
										),
										
										const Padding(padding: EdgeInsets.only(top: 10)),

										TextField(
											obscureText: _ocult!,
											decoration: InputDecoration(
												filled: true,
												fillColor: const Color.fromARGB(255, 47,51,68),
												border: const OutlineInputBorder(
													borderRadius: BorderRadius.all(Radius.circular(10.0)),
												),
												enabledBorder: const OutlineInputBorder(
													borderSide:const BorderSide(
														color: Color.fromARGB(255, 47,51,68)
													)
												),
												focusedBorder: const OutlineInputBorder(
													borderSide:BorderSide(
														color: Color.fromARGB(255, 47,51,68)
													)
												),
												labelText: "Senha",
												prefixIcon: const Icon(Icons.lock),
												prefixIconColor: const Color.fromARGB(255, 20,57,190),
												suffixIcon: IconButton(
													onPressed: (){
														if(_ocult! == true){
															setState(() {
																iconSenha = Icons.visibility;	
																_ocult = false;
															});
														}else{
															setState(() {
																iconSenha = Icons.visibility_off;	
																_ocult = true;
															});
														}
													},
													icon: Icon(iconSenha)
												),
												suffixIconColor: const Color.fromARGB(255, 20,57,190)
											),
										),
									],
								),
						),
						const Padding(padding: EdgeInsets.only(top: 30)),
						ElevatedButton(
							style: const ButtonStyle(
								backgroundColor: WidgetStatePropertyAll(
									Color.fromARGB(255,35, 105, 242),
								),
								fixedSize: WidgetStatePropertyAll(
									Size(475, 49),
								),
							),
							onPressed: (){
								Navigator.pushNamed(
									context, 
									MyRoutes.perfil
								);
							}, 
							child: const Text(
								style: TextStyle(
									color: Color.fromARGB(255, 255, 255, 255),
								),
								"Cadastrar"
							),
						),

						const Padding(padding: EdgeInsets.only(top: 50)),

						Row(
							mainAxisAlignment: MainAxisAlignment.center,
							children: [
								Image.asset(
									"assets/images/facebook_icon.png",
									width: 50,
									height: 50,
								),
								Padding(
									padding: const EdgeInsets.only(left:35),
									child: Image.asset(
										"assets/images/google_icon.png",
										width: 50,
										height: 50,
									),
								),
								Padding(
									padding: const EdgeInsets.only(left:35),
									child: Image.asset(
										"assets/images/apple_icon.png",
										width: 50,
										height: 50,
									),
								),
							],
						),
						Padding(padding: EdgeInsets.only(top: sizeTop * 0.08)),
						Row(
							mainAxisAlignment: MainAxisAlignment.center,
							children: [
								const Text(
									"Já possui uma conta?"
								),
								TextButton(
									onPressed: (){
										Navigator.pushNamed(
											context, 
											MyRoutes.login
										);
									},
									child: const Text(
										"Entrar",
										style: TextStyle(
											color: Color.fromARGB(255, 35, 105, 242)
										),
									),
								),
							],
						) 
					],
				),
			),
		);
  	}
}