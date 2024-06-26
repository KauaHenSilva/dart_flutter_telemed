import 'dart:convert';

import 'package:telemed/data/perfil_data.dart';
import 'package:telemed/screens/backend/perfil.dart';
import 'package:http/http.dart' as http;

class Perfilbend{
	final _url = "https://telemed-f4e7e-default-rtdb.firebaseio.com/";

	void savePerfil(Map<String, Object> data){
		// bool hasId = data['id'] != null;

		final perfil = Perfil(
			nome: data['nome'] as String,
			apelido: data['apelido'] as String,
			dataNasc: data['dataNasc'] as String,
			email: data['email'] as String,
			genero: data['genero'] as String,
		);

		addPerfil(perfil);
		dados = perfil;
	}

	void addPerfil(Perfil perfil){
		http.post(
			Uri.parse('$_url/perfil.json'),
			body: jsonEncode(
				{
				"nome": perfil.nome,
				"apelido": perfil.apelido,
				"dataNasc": perfil.dataNasc,
				"email": perfil.email,
				"genero": perfil.genero,
				},
			),
		);
	}

	Future<List<Perfil>> recebePerfil() async {
		http.Response response = await http.get(
			Uri.parse(
				"$_url/perfil.json" 
			)
		);

		if(response.statusCode == 200){
			Map<String,dynamic> dadosJson = json.decode(response.body);
			List<Perfil> perfis = [];

    		dadosJson.forEach((key, value) {
				perfis.add(Perfil.fromJson(value));
    		});

			return perfis;
		}else{
			return List<Perfil>.empty();
		}
	}

}