import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
	bool? ocult = true;
	IconData iconSenha = Icons.visibility_off;
  	
	@override

  	Widget build(BuildContext context) {
		final mediaQuery = MediaQuery.of(context);
		final sizeTop = mediaQuery.size.height;
		final sizeWidth = mediaQuery.size.width;

		return Scaffold(
			body: Container(
				color: const Color.fromARGB(255,36,39,51),
				padding: EdgeInsets.only(top: sizeTop * 0.1,left: sizeWidth * 0.05,right: sizeWidth * 0.05),
				margin: const EdgeInsets.all(10),
				child:  SingleChildScrollView(
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
								onPressed: (){
									
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
										"Não possui uma conta?"
									),
									TextButton(
										onPressed: (){
											print("Oi");
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
			),
		);
  	}
}