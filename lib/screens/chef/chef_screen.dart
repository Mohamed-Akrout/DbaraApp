
import 'package:dbara_app/screens/chef/components/body.dart';
import 'package:flutter/material.dart';
import '../../components/custom_bottom_nav_bar.dart';
import '../../enums.dart';


class ChefScreen extends StatelessWidget {
  static String routeName = "/chef";

  const ChefScreen({super.key,});


  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Body(),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }
}