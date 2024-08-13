import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:telemed/components/drawer_glob.dart';
import 'package:telemed/screens/introScreen/components/image_people.dart';
import 'package:telemed/screens/introScreen/components/my_elevetion_button.dart';
import 'package:telemed/screens/introScreen/components/re_button.dart';
import 'package:telemed/utils/my_routes.dart';

class InitPage extends StatefulWidget {
  const InitPage({super.key});

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  final _controller = PageController(keepPage: true);
  bool onLastPage = false;
  int currentPage = 0;

  final List<String> pageTexts = [
    "Milhares de médicos e especialistas para ajudar sua saúde",
    "Verificações e consultas de saúde facilmente em qualquer lugar a qualquer hora",
    "Vamos começar a viver com saúde e bem conosco agora mesmo!",
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizeTopBar = MediaQuery.of(context).padding.top;

    return Scaffold(
      drawer: const DrawerGlob(),
      body: Column(
        children: [
          SizedBox(height: sizeTopBar),
          Expanded(
            child: Stack(
              children: [
                PageView(
                  controller: _controller,
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                      onLastPage = (value == 2);
                    });
                  },
                  children: [
                    ImagePeople(
                      size: size.height > 800
                          ? size.height * 0.8
                          : size.height * 0.9,
                      image: "assets/medic/medic1.png",
                      sizebottom: 0,
                    ),
                    ImagePeople(
                      size: size.height > 800
                          ? size.height * 0.8
                          : size.height * 0.9,
                      image: "assets/medic/medic2.png",
                      sizebottom: 0,
                    ),
                    ImagePeople(
                      size: size.height > 800
                          ? size.height * 0.7
                          : size.height * 0.8,
                      image: "assets/medic/medic3.png",
                      sizebottom: size.height * 0.1,
                    ),
                  ],
                ),
                if (currentPage > 0)
                  Positioned(
                    top: 30,
                    left: 10,
                    child: ReButton(
                      onPressed: () {
                        _controller.previousPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeOut,
                        );
                      },
                    ),
                  ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    width: double.infinity,
                    height: size.height * 0.40,
                    decoration: BoxDecoration(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 100),
                          transitionBuilder:
                              (Widget child, Animation<double> animation) {
                            return FadeTransition(
                                opacity: animation, child: child);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              pageTexts[currentPage],
                              key: ValueKey<int>(currentPage),
                              style: Theme.of(context).textTheme.displayLarge,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        size.width > 400
                            ? const SizedBox(height: 20)
                            : const SizedBox(height: 10),
                        SmoothPageIndicator(
                          controller: _controller,
                          count: 3,
                          effect: const ExpandingDotsEffect(
                            dotHeight: 6,
                            dotWidth: 6,
                          ),
                        ),
                        onLastPage
                            ? MyElevetionButton(
                                onPressed: () {
                                  Navigator.pushNamed(context, MyRoutes.home);
                                },
                                text: "Começar",
                              )
                            : MyElevetionButton(
                                onPressed: () {
                                  _controller.nextPage(
                                    duration: const Duration(milliseconds: 400),
                                    curve: Curves.easeOut,
                                  );
                                },
                                text: "Próximo",
                              ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
