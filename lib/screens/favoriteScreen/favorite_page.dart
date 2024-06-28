import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Medicos {
  final String nome;
  final String especialidade;
  final double qtdEstrelas;
  final int qtdAvaliacoes;
  final String urlImagem;

  double myQtdestrelas = 0.0;
  bool isFavorite = false;

  Medicos({
    required this.nome,
    required this.especialidade,
    required this.qtdEstrelas,
    required this.qtdAvaliacoes,
    required this.urlImagem,
  });

  void toggleFavorite() {
    isFavorite = !isFavorite;
  }

  void setQtdestrelas(double qtdestrelas) {
    myQtdestrelas = qtdestrelas;
  }
}

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final List<Medicos> medicos = [
    Medicos(
      nome: 'Dr. João',
      especialidade: 'Cardiologista',
      qtdEstrelas: 4.5,
      qtdAvaliacoes: 100,
      urlImagem: 'assets/medic/medic_fav1.png',
    ),
    Medicos(
      nome: 'Dr. Maria',
      especialidade: 'Dermatologista',
      qtdEstrelas: 4.8,
      qtdAvaliacoes: 200,
      urlImagem: 'assets/medic/medic_fav2.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu medico favorito'),
      ),
      body: ListView.builder(
        itemCount: medicos.length,
        itemBuilder: (ctx, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 129,
                      width: size.width <= 320 ? 90 : 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).canvasColor,
                        image: DecorationImage(
                          image: AssetImage(
                            medicos[index].urlImagem,
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              medicos[index].nome,
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            const Spacer(),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    medicos[index].toggleFavorite();
                                  });
                                },
                                icon: medicos[index].isFavorite
                                    ? const Icon(
                                        Icons.favorite,
                                        color: Colors.blue,
                                      )
                                    : const Icon(
                                        Icons.favorite,
                                      )),
                            SizedBox(width: size.width * 0.02),
                          ],
                        ),
                        Divider(
                          height: 0,
                          endIndent: size.width * 0.02,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          medicos[index].especialidade,
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Stack(
                              children: [
                                RatingBar.builder(
                                  initialRating: medicos[index].qtdEstrelas,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 15,
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.blue[400],
                                  ),
                                  onRatingUpdate: (double value) {},
                                ),
                                RatingBar.builder(
                                  initialRating: medicos[index].myQtdestrelas,
                                  allowHalfRating: true,
                                  itemCount: 5,
                                  itemSize: 15,
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.blue,
                                  ),
                                  onRatingUpdate: (rating) {
                                    setState(() {
                                      medicos[index].setQtdestrelas(rating);
                                    });
                                  },
                                )
                              ],
                            ),
                            SizedBox(width: size.width * 0.02),
                            Text(
                              '${medicos[index].qtdEstrelas}',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    fontSize: 10,
                                  ),
                            ),
                            const Spacer(),
                            Text(
                              '(${medicos[index].qtdAvaliacoes} avaliações)',
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(
                                    fontSize: 10,
                                    color: Colors.grey[600],
                                  ),
                            ),
                            SizedBox(width: size.width * 0.02),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
