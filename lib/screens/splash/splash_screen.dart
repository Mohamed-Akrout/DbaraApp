import 'package:dbara_app/size_config.dart';
import 'package:flutter/material.dart';

import 'package:dbara_app/screens/splash/components/body.dart';

class SplashScreen extends StatelessWidget {
  static String routeName = "/spllash";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
    );
  }
}
