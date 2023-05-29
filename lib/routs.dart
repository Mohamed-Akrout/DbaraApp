

import 'package:dbara_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:dbara_app/screens/home/home_screen.dart';
import 'package:dbara_app/screens/otp/otp_screen.dart';
import 'package:dbara_app/screens/popular_recipe/popular_screen.dart';
import 'package:dbara_app/screens/profile/profile_screen.dart';
import 'package:dbara_app/screens/side_menu/side_screen.dart';
import 'package:dbara_app/screens/sign_up/sign_up.dart';
import 'package:dbara_app/screens/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';



final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignUpScreen.routeName: (context) => const SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => const CompleteProfileScreen(),
  OtpScreen.routeName: (context) => const OtpScreen(),
  HomeScreen.routeName: (context) => const HomeScreen(recipes: [],),
  SideScreen.routeName: (context) => const SideScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  PopularScreen.routeName: (context) => const PopularScreen()
};
