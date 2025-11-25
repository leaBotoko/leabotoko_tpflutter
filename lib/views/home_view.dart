import 'package:flutter/material.dart';
import '../controllers/auth_controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = AuthController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await authController.logout();
              Navigator.pushReplacementNamed(context, '/');
            },
          )
        ],
      ),
      body: const Center(
        child: Text(
          'Bienvenue sur la page d\'accueil !',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
