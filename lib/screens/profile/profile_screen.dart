import 'package:dbara_app/screens/profile/components/body.dart';
import 'package:flutter/material.dart';


import '../../components/custom_bottom_nav_bar.dart';
import '../../enums.dart';


class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";

  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Body(),
      bottomNavigationBar: const CustomBottomNavBar(selectedMenu: MenuState.profile),
    );
  }
}