import 'package:flutter/material.dart';
import 'package:telemed/utils/my_routes.dart';

class DrawerGlob extends StatelessWidget {
  const DrawerGlob({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
            child: const Image(image: AssetImage('assets/logos/logo.png')),
          ),
          ListTile(
            title: const Text('Home'),
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.home);
            },
          ),
          ListTile(
            title: const Text('Intro'),
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.init);
            },
          ),
          ListTile(
            title: const Text('Welcome'),
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.welcome);
            },
          ),
        ],
      ),
    );
  }
}
