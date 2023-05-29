import '../../components/custom_bottom_nav_bar.dart';
import '../../enums.dart';
import 'package:flutter/material.dart';

import '../popular_recipe/components/body.dart';

class PopularScreen extends StatelessWidget {
  static String routeName = "/favourite";

  const PopularScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Popular"),
      ),
      body: PopularArticlesPage(),
      bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.favourite),
    );
  }
}