import 'package:flutter/material.dart';
import 'package:telemed/screens/backend/auth.dart';
import 'package:telemed/screens/backend/classes_app.dart';
import 'package:telemed/screens/home/home_navigation.dart';
import 'package:telemed/utils/my_routes.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
	bool? ocult = true;
	IconData iconSenha = Icons.visibility_off;

	String? errorEmail;
	String? errorPassword;

	TextEditingController email = TextEditingController();
	TextEditingController password = TextEditingController();
  	
	@override
  	Widget build(BuildContext context) {
		final mediaQuery = MediaQuery.of(context);
		final sizeTop = mediaQuery.size.height;
		final sizeWidth = mediaQuery.size.width;

		return Scaffold(
			appBar: AppBar(
				forceMaterialTransparency: true,
			),
			backgroundColor: const Color.fromARGB(255,36,39,51),
			body: SingleChildScrollView(
				padding: EdgeInsets.only(left: sizeWidth * 0.05,right: sizeWidth * 0.05),
				child: Column(
					children: [
						Image.asset(
							"assets/images/login.png",
							width: 224,
							height: sizeTop * 0.23,
						),
						const Text(
							"Deixar Voce Entrar",
							style: TextStyle(
								fontSize: 30,
							),
						),
						const Padding(padding: EdgeInsets.only(top: 10)),
						Column(
							children: [
								TextField(
									controller: email,
									decoration: InputDecoration(
										filled: true,
										fillColor: const Color.fromARGB(255, 47,51,68),
										border: const OutlineInputBorder(
											borderRadius: BorderRadius.all(Radius.circular(10.0)),
										),
										enabledBorder: const OutlineInputBorder(
											borderSide:BorderSide(
												color: Color.fromARGB(255, 47,51,68)
											)
										),
										focusedBorder: const OutlineInputBorder(
											borderSide:BorderSide(
												color: Color.fromARGB(255, 47,51,68)
											)
										),
										prefixIcon: const Icon(Icons.email),
										errorText: errorEmail,
										prefixIconColor: const Color.fromARGB(255, 20,57,190),
										labelText: "E-mail",
									),
									
								),
								const Padding(padding: EdgeInsets.only(top: 10)),

								TextField(
									controller: password,
									obscureText: ocult!,
									decoration: InputDecoration(
										filled: true,
										fillColor: const Color.fromARGB(255, 47,51,68),
										border: const OutlineInputBorder(
											borderRadius: BorderRadius.all(Radius.circular(10.0)),
										),
										enabledBorder: const OutlineInputBorder(
											borderSide: BorderSide(
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
										errorText: errorPassword,
										suffixIcon: IconButton(
											onPressed: (){
												if(ocult! == true){
													setState(() {
														iconSenha = Icons.visibility;	
														ocult = false;
													});
												}else{
													setState(() {
														iconSenha = Icons.visibility_off;	
														ocult = true;
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

						const Padding(padding:EdgeInsets.only(top: 30)),

						ElevatedButton(
							style: const ButtonStyle(
								backgroundColor: WidgetStatePropertyAll(
									Color.fromARGB(255,35, 105, 242),
								),
								fixedSize: WidgetStatePropertyAll(
									Size(475, 49),
								),
							),
							onPressed: () async {
								String? error = await Auth().entrar(
									Autenticacao(
										email: email.text, 
										password: password.text
									)
								);

								setState(() {
									if(error == 'invalid-email'){
										errorEmail = 'Error, Email Inválido!';
									}else if(error == 'user-not-found'){
										errorEmail = 'Error, este usuário não está cadastrado!';
									}else if(error == 'user-disabled'){
										errorEmail = 'Error, usuário está desabilitado!';
									}else if(error == 'channel-error'){
										errorEmail = 'Error, endereço de e-mail vazio!';
									}else if(error == 'invalid-credential'){
										errorEmail = 'Erro, credencial invalida';
									}

									if(error == 'wrong-password'){
										errorPassword = 'Error, senha incorreta!';
									}
								});

								if(error == null){
									Navigator.pushReplacement(
										context, 
										MaterialPageRoute(
											builder: (context) => const HomePrincipal()
										)
									);
								}
								
							}, 
							child: const Text(
								style: TextStyle(
									color: Color.fromARGB(255, 255, 255, 255),
								),
								"Entrar"
							),
						),
						
						const Padding(padding:EdgeInsets.only(top: 50)),
						
						Row(
							mainAxisAlignment: MainAxisAlignment.center,
							children: [
								Image.asset(
									"assets/icons/facebook_icon.png",
									width: 50,
									height: 50,
								),
								Padding(
									padding: const EdgeInsets.only(left:35),
									child: Image.asset(
										"assets/icons/google_icon.png",
										width: 50,
										height: 50,
									),
								),
								Padding(
									padding: const EdgeInsets.only(left:35),
									child: Image.asset(
										"assets/icons/apple_icon.png",
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
									"Não possui uma conta?"
								),
								TextButton(
									onPressed: (){
										Navigator.pushNamed(
											context, 
											MyRoutes.cadastro
										);
									},
									child: const Text(
										"Cadastrar",
										style: TextStyle(
											color: Color.fromARGB(255, 35, 105, 242)
										),
									),
								),
							],
						) 
					],
				),
			)
		);
  	}
}