import 'package:flutter/material.dart';

class HomeArtigo extends StatefulWidget {
  const HomeArtigo({super.key});

  @override
  State<HomeArtigo> createState() => _HomeArtigoState();
}

class _HomeArtigoState extends State<HomeArtigo> {
  @override
  Widget build(BuildContext context) {
    return const Center(
		child: Text(
			"Artigos"
		)
	);
  }
}