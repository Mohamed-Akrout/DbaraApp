import 'package:dbara_app/screens/home/home_screen.dart';
import 'package:dbara_app/screens/sign_up/components/body.dart';
import 'package:flutter/material.dart';
import '../../size_config.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName="/sign_up";

  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, HomeScreen.routeName);
              },
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
              child: const Text('Skip'),
          ),
        ],
      ),
      body: const Body(),
    );
  }
}
