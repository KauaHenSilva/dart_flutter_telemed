class Perfil{
	String nome;
	String apelido;
	String dataNasc;
	String email;
	String genero;

	Perfil({
		required this.nome,
		required this.apelido,
		required this.dataNasc,
		required this.email,
		required this.genero,
	});

	factory Perfil.fromJson(Map<String,dynamic> json){
		return Perfil(
			nome: json["nome"],
			apelido: json["apelido"],
			dataNasc: json["dataNasc"],
			email: json["email"],
			genero: json["genero"],
		);
		
	}
}