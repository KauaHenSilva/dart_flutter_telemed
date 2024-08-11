import 'package:flutter/material.dart';

class ButtonHome extends StatelessWidget {
	final Function()? funcao;
	final String? name;
	final String? caminho;
	final EdgeInsetsGeometry paddingButton; 

	const ButtonHome({
		super.key,
		required this.funcao,
		required this.name,
		required this.caminho,
		required this.paddingButton,
	});

	@override
	Widget build(BuildContext context) {
		return GestureDetector(
			onTap: funcao,
			child: MouseRegion(
				cursor: SystemMouseCursors.click,
				child: Column(
					children: [
						CircleAvatar(
							radius: 25,
							backgroundColor: Colors.white,
							child: Padding(
								padding: paddingButton,
								child: Image.asset(
									caminho!
								),
							),
						),
						Text(
							name!,
							style: const TextStyle(
								fontSize: 12,
								color: Colors.white
							),
						)
					],	
				)
			),
		);
	}

}