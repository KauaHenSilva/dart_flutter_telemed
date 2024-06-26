import 'package:flutter/material.dart';
import 'package:telemed/screens/backend/perfil.dart';
import 'package:telemed/screens/backend/perfil_bend.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:telemed/screens/home/home_navigation.dart';

class PerfilPage extends StatefulWidget {
	final String? email;

  	const PerfilPage(this.email, {super.key});

  @override
  State<PerfilPage> createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {

	String? _generoSelected;
	final TextEditingController _dataEntrada = TextEditingController();

  	final _formKey = GlobalKey<FormState>();
	final _formData = <String, Object>{};

	late TextEditingController _controllerEmail = TextEditingController();

	@override
	void initState() {
		super.initState();
		_controllerEmail = TextEditingController(text: widget.email);
	}

	@override
	void didChangeDependencies() {
		super.didChangeDependencies();

		if (_formData.isEmpty) {
			final arg = ModalRoute.of(context)?.settings.arguments;

			if (arg != null) {
				final perfil = arg as Perfil;
				_formData['nome'] = perfil.nome;
				_formData['apelido'] = perfil.apelido;
				_formData['dataNasc'] = perfil.dataNasc;
				_formData['email'] = perfil.email;
				_formData['genero'] = perfil.genero;
			}
		}
	}

	@override
	void dispose() {
		_controllerEmail.dispose();
		super.dispose();
	}

	bool _submitForm() {
		final isValid = _formKey.currentState?.validate() ?? false;

		if (!isValid) {
			return false;
		}

		_formKey.currentState?.save();

		Provider.of<Perfilbend>(
			context,
			listen: false,
		).savePerfil(_formData);

		return true;
	}

	@override
	Widget build(BuildContext context) {

		Future<void> selectData() async {
			DateTime? picked = await showDatePicker(
			context: context, 
			initialDate: DateTime.now(),
			firstDate: DateTime(2000), 
			lastDate: DateTime(2100),
			locale: const Locale('pt','BR')
			);

			if(picked != null){
				setState(() {
				  _dataEntrada.text = DateFormat('dd/MM/yyyy').format(picked);
				});
			}
		}

		final mediaQuery = MediaQuery.of(context);
		final sizeTop = mediaQuery.size.height;
		final sizeWidth = mediaQuery.size.width;		

		return Scaffold(
			appBar: AppBar(
				forceMaterialTransparency: true,
			),
			backgroundColor: const Color.fromARGB(255,36,39,51),
			body: Container(
				margin: const EdgeInsets.all(5),
				padding: EdgeInsets.only(top: sizeTop * 0.06,left: sizeWidth * 0.05,right: sizeWidth * 0.05),
				child: SingleChildScrollView(
					child: Column(
						crossAxisAlignment: CrossAxisAlignment.center,
						children: [
							Stack(
								alignment: AlignmentDirectional.bottomEnd,
								children: [
									const CircleAvatar(
										radius: 80,
										backgroundColor: Color.fromARGB(255, 79, 79, 79),
										child: Icon(
											Icons.person_outline,
											size: 150,
											color: Colors.grey,
										),
									),
									IconButton(
										onPressed: (){
										}, 
										icon: const Icon(Icons.edit),
										style: const ButtonStyle(
											backgroundColor: WidgetStatePropertyAll(
												Color.fromARGB(255, 35, 105, 242)
											),
											iconColor: WidgetStatePropertyAll(
												Colors.white
											),
										),
									)
								],
							),
							const Padding(padding: EdgeInsets.only(top: 20)),
							Form(
								key: _formKey,
								child: Column(
									children: [
										const Padding(padding:  EdgeInsets.only(top: 20)),
										TextFormField(
											validator: (nomeV){
												final nome = nomeV!;
												
												if(nome.trim().isEmpty){
													return 'Nome é obrigatório';
												}
												if(nome.trim().length < 3){
													return 'Nome incompleto';
												}

												return null;
											},
											onSaved: (nome) => _formData['nome'] = nome ?? '',
											textInputAction: TextInputAction.next,
											decoration: const InputDecoration(
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
												labelText: "Nome Completo",
												labelStyle: TextStyle(
													color: Color.fromARGB(200, 255, 255, 255)
												)
											),
											cursorColor: Colors.white,
										),

										const Padding(padding: EdgeInsets.only(top: 20)),

										TextFormField(
											validator: (apelidoV){
												final apelido = apelidoV!;

												if(apelido.trim().isEmpty){
													return 'Apelido vazio, por favor preencha';
												}
												if(apelido.trim().length > 10){
													return 'Apelido muito grande';
												}
												if(apelido.trim().length < 3){
													return 'Apelido pequeno';
												}

												return null;
											},
											onSaved: (apelido) => _formData['apelido'] = apelido ?? '',
											textInputAction: TextInputAction.next,
											decoration: const InputDecoration(
												filled: true,
												fillColor: Color.fromARGB(255, 47,51,68),
												border: OutlineInputBorder(
													borderRadius: BorderRadius.all(Radius.circular(10.0))
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
												labelText: "Apelido",
												labelStyle: TextStyle(
													color: Color.fromARGB(200, 255, 255, 255)
												)
											),
											cursorColor: Colors.white,
										),
										
										const Padding(padding: EdgeInsets.only(top: 20)),

										TextFormField(
											validator: (data){
												if(data!.trim().isEmpty){
													return 'Insira uma data válida';
												}

												try{
													DateFormat('dd/MM/yyyy').parseStrict(data);
												}catch(e){
													return 'Insira sua data de nascimento novamente';
												}

												return null;
											},
											onSaved: (data) => _formData['dataNasc'] = data ?? '',
											controller: _dataEntrada,
											decoration: const InputDecoration(
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
												labelText: "Data de Nascimento",
												labelStyle: TextStyle(
													color: Color.fromARGB(200, 255, 255, 255)
												),
												suffixIcon: Padding(
													padding: EdgeInsetsDirectional.only(end: 12.0),
													child: Icon(Icons.date_range_outlined), // myIcon is a 48px-wide widget.
												)
											),
											cursorColor: Colors.white,
											onTap: (){
												selectData();
											},
										),
										
										const Padding(padding: EdgeInsets.only(top: 20)),

										TextFormField(
											controller: _controllerEmail,
											onSaved: (email) => _formData['email'] = email ?? '',
											keyboardType: TextInputType.emailAddress,
											decoration: const InputDecoration(
												filled: true,
												fillColor: Color.fromARGB(255, 47,51,68),
												border: OutlineInputBorder(
													borderRadius: BorderRadius.all(Radius.circular(10.0))
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
												labelText: "E-mail",
												disabledBorder: OutlineInputBorder(
													borderSide:BorderSide(
														color: Color.fromARGB(255, 47,51,68)
													)
												),
												enabled: false,
												labelStyle: TextStyle(
													color: Color.fromARGB(200, 255, 255, 255)
												),
												suffixIcon: Padding(
													padding: EdgeInsetsDirectional.only(end: 12.0),
													child: Icon(Icons.email), // myIcon is a 48px-wide widget.
												)
											),
											cursorColor: Colors.white,
										),
										
										const Padding(padding: EdgeInsets.only(top:20)),
										
										DropdownButtonFormField<String>(
											validator: (generoV){
												if(generoV == null){
													return 'Selecione seu gênero';
												}
												
												final genero = generoV;

												if(genero.trim().isEmpty){
													return 'Por favor, coloque seu gênero';
												}

												return null;
											},
											onSaved: (genero) => _formData['genero'] = genero ?? '',
											value: _generoSelected,
											borderRadius: const BorderRadius.all(Radius.circular(5)),
											isExpanded: true,
											onChanged: (String? generoNew){
												setState(() {
													_generoSelected = generoNew!;
												});
											},
											dropdownColor: const Color.fromARGB(255,47,51,68),
											decoration: const InputDecoration(
												filled: true,
												fillColor: Color.fromARGB(255, 47,51,68),
												border: OutlineInputBorder(
													borderRadius: BorderRadius.all(Radius.circular(10.0))
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
												labelText: "Gênero",
												labelStyle: TextStyle(
													color: Color.fromARGB(200, 255, 255, 255)
												)
											),
											items: const [
												DropdownMenuItem(
													value: "Masculino",
													child: Text('Masculino')
												),
												DropdownMenuItem(
													value: "Feminino",
													child: Text('Feminino')
												),
												DropdownMenuItem(
													value: "Gay",
													child: Text('Outros')
												),
											],
										),
									],
								),
							),
							
							const Padding(padding: EdgeInsets.only(top:20)),

							ElevatedButton(
								onPressed: (){
									bool result = _submitForm();
									
									if(result){
										Navigator.push(
											context, 
											MaterialPageRoute(
												builder: (context) => HomePrincipal(
													widget.email
												)
											)
										);
									}
								}, 
								style: ButtonStyle(
									backgroundColor: const WidgetStatePropertyAll(
										Color.fromARGB(255, 35, 105, 242)
									),
									fixedSize: WidgetStatePropertyAll(
										Size(sizeWidth * 0.95, 50)
									),
									shape: WidgetStateProperty.all<RoundedRectangleBorder>(
										RoundedRectangleBorder(
											borderRadius: BorderRadius.circular(10.0),
										)
									)
								),
								child: const Text(
									"Continue",
									style: TextStyle(
										color: Color.fromARGB(255, 255, 255, 255),
										fontSize: 19
									),
								),
							)
						],
					),
				),
			),
		);
	}
}