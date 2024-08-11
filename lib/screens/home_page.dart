import 'package:flutter/material.dart';
import 'package:telemed/components/drawer_glob.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      drawer: const DrawerGlob(),
      body: const Center(
        child: Text("Home"),
      ),
    );
  }
}