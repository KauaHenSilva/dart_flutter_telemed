import 'package:flutter/material.dart';

class ButtonMedicos extends StatelessWidget {
	final String? name;
	final void Function()? onPressed;

	const ButtonMedicos({
		super.key,
		required this.name,
		required this.onPressed,
	});

	@override

	Widget build(BuildContext context) {

		return Padding(
			padding: const EdgeInsets.only(right: 10),
			child: ElevatedButton(
				onPressed: onPressed, 
				style: ElevatedButton.styleFrom(
					backgroundColor: const Color.fromARGB(255, 36,39,51),
					shape: const ContinuousRectangleBorder(
						side: BorderSide(
							color: Color.fromARGB(255, 0,71,255)
						),
						borderRadius: BorderRadius.all(
							Radius.circular(20)
						)
					)		
				),
				child:Text(
					name!,
					style: const TextStyle(
						color: Colors.white
					),
				)
			), 
		);
	}
}