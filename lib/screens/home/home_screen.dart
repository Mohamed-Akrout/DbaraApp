import 'package:dbara_app/models/data.dart';
import 'package:flutter/material.dart';
import '../../components/custom_bottom_nav_bar.dart';
import '../../enums.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";

  const HomeScreen({super.key,  required this.recipes });

  final List<Recipe> recipes;

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Body(recipe: null),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}