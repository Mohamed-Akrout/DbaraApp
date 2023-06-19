import 'package:flutter/material.dart';


import 'components/body.dart';

class SideScreen extends StatelessWidget {
  static String routeName = "/cart";

  const SideScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white24,
       child: const Body(),
      ),
    );
  }
}