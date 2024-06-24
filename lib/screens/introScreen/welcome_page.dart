import 'package:flutter/material.dart';
import 'package:telemed/screens/introScreen/components/my_elevetion_button.dart';
import 'package:telemed/utils/my_routes.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final sizeTopBar = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: sizeTopBar),
              Image(
                image: const AssetImage(
                  "assets/medic/medics1.png",
                ),
                fit: BoxFit.fitWidth,
                height: size.height * 0.50,
                width: double.infinity,
              ),
              const Spacer(),
              SizedBox(height: size.height * 0.05),
              Text(
                'Bem-vindo à Telemed! 👋'.toUpperCase(),
                style: Theme.of(context).textTheme.displayMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: size.height * 0.05),
              Text(
                'Aqui você encontra os melhores profissionais da saúde para te ajudar!',
                style: Theme.of(context).textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              MyElevetionButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, MyRoutes.init);
                },
                text: "Prosseguir",
              ),
              SizedBox(height: size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
