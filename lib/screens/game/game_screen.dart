import 'package:flutter/material.dart';
import '../../components/custom_bottom_nav_bar.dart';
import '../../enums.dart';
import 'package:dbara_app/screens/game/components/body.dart';

class GameScreen extends StatefulWidget {
  static String routeName = "/game";

  const GameScreen({super.key,});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Body(),
         // _buildCookieBanner(), // Affiche le cookie
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}
