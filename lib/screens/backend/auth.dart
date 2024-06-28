import 'package:firebase_auth/firebase_auth.dart';
import 'package:telemed/screens/backend/classes_app.dart';

class Auth {

	String? validaSenha(String password){
		final senha = password;

		if(senha.trim().isEmpty){
			return 'Senha vazia';
		}			
		
		if(senha.length < 8){
			return 'Senha pequena, tem que ter no minimo 8 caracteres';
		}

		if(!senha.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))){
			return 'Senha tem que possuir pelo menos um caractere especial';
		}

		int upper = RegExp(r'[A-Z]').allMatches(senha).length;
		int lower = RegExp(r'[a-z]').allMatches(senha).length;

		int countLetters = lower + upper;

		if(countLetters < 5){
			return 'Senha tem que possuir pelo menos 5 letras';
		}


		int countDigits = RegExp(r'\d').allMatches(senha).length;
		if(countDigits < 2){
			return 'Senha tem que possuir pelo menos dois numeros';
		}

		return null;
	}

	Future<String?> entrar(Autenticacao conta) async {
		FirebaseAuth auth = FirebaseAuth.instance;
		

		String? error;
		
		try{
			await auth.signInWithEmailAndPassword(
				email: conta.email,
				password: conta.password,
			);
			error = null;
		}on FirebaseAuthException catch (e){
			error = e.code;
		}
		return error;
	}

	Future<String?> cadastra(Autenticacao conta) async {
		FirebaseAuth auth = FirebaseAuth.instance;
		String? error;

		try{
			await auth.createUserWithEmailAndPassword(
				email: conta.email,
				password: conta.password,
			);
			error = null;
		}on FirebaseAuthException catch (e){
			error = e.code;
			
		}
		
		return error;
	}

	void sair(FirebaseAuth auth){

		auth.signOut();
		
	}

}