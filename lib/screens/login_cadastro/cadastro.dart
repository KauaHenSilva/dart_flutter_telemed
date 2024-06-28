import 'package:flutter/material.dart';
import 'package:telemed/screens/backend/auth.dart';
import 'package:telemed/screens/backend/classes_app.dart';
import 'package:telemed/screens/login_cadastro/perfil_page.dart';
import 'package:telemed/utils/my_routes.dart';

class Cadastro extends StatefulWidget {
  const Cadastro({super.key});

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
	bool? _ocult = true;

	IconData iconSenha = Icons.visibility_off;
	final _formKey = GlobalKey<FormState>();

	String? errorPassword;
	String? errorEmail;

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
				automaticallyImplyLeading: true,
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
							"Criar Uma Nova Conta",
							style: TextStyle(
								fontSize: 30,
							),
						),
						Form(
							key: _formKey,
							child:  Column(
								children: [
									TextField(
										controller: email,
										decoration:  InputDecoration(
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
											errorText: errorEmail,
											prefixIcon: const Icon(Icons.email),
											prefixIconColor: const Color.fromARGB(255, 20,57,190),
											labelText: "E-mail",
										),
										
									),
									
									const Padding(padding: EdgeInsets.only(top: 10)),

									TextField(
										controller: password,
										obscureText: _ocult!,
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
							onPressed: () async {
								

								String? error = await Auth().cadastra(
									Autenticacao(
										email: email.text, 
										password: password.text
									)
								);
								
								setState(() {
									errorPassword =  Auth().validaSenha(password.text);

									if(error == 'email-already-in-use'){
										errorEmail = 'Error, este e-mail já possui uma conta!';
									}else if(error == 'invalid-email'){
										errorEmail = 'Error, endereço de e-mail inválido!';
									}else if(error == 'missing-email'){
										errorEmail = 'Error, endereço de e-mail vazio!';
									}
									
								});

								if(error == null){
									Navigator.pushAndRemoveUntil(
										context, 
										MaterialPageRoute(
											builder: (context) => const PerfilPage()
										),
										(Route<dynamic> route) => false,
									);
								}
							}, 
							child: const Text(
								style:  TextStyle(
									color: Color.fromARGB(255, 255, 255, 255),
								),
								"Cadastrar"
							),
						),

						const Padding(padding:  EdgeInsets.only(top: 50)),

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