import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}



class _PerfilState extends State<Perfil> {

	String? generoSelected;
	final TextEditingController _dataEntrada = TextEditingController();

	@override

	Widget build(BuildContext context) {

		Future<void> selectData() async {
			DateTime? picked = await showDatePicker(
			context: context, 
			initialDate: DateTime.now(),
			firstDate: DateTime(2000), 
			lastDate: DateTime(2100)
			);

			if(picked != null){
				setState(() {
				  _dataEntrada.text = picked.toString().split(" ")[0];
				});
			}
		}

		final mediaQuery = MediaQuery.of(context);
		final sizeTop = mediaQuery.size.height;
		final sizeWidth = mediaQuery.size.width;

		return Scaffold(
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
										backgroundImage: AssetImage(
											"assets/images/people.png"
										),
									),
									IconButton(
										onPressed: (){}, 
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
							Column(
								children: [
									const Padding(
										padding: EdgeInsets.only(top: 20),
										child: TextField(
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
												labelText: "Nome Completo",
												labelStyle: TextStyle(
													color: Color.fromARGB(200, 255, 255, 255)
												)
											),
											cursorColor: Colors.white,
										),
									),
									 const Padding(
										padding: EdgeInsets.only(top: 20),
										child: TextField(
											decoration: InputDecoration(
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
									),
									const Padding(padding: EdgeInsets.only(top: 20)),
									TextField(
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
									const Padding(
										padding: EdgeInsets.only(top: 20),
										child: TextField(
											keyboardType: TextInputType.emailAddress,
											decoration: InputDecoration(
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
									),
								],
							),
							Padding(
								padding: const EdgeInsets.only(top:20,bottom:20),
								child: DropdownButtonFormField<String>(
									value: generoSelected,
									borderRadius: const BorderRadius.all(Radius.circular(5)),
									isExpanded: true,
									onChanged: (String? generoNew){
										setState(() {
											generoSelected = generoNew!;
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
							),
							ElevatedButton(
								onPressed: (){

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