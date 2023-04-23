import 'package:dbara_app/models/data.dart';
import 'package:dbara_app/screens/complete_profile/complete_profile_screen.dart';
import 'package:dbara_app/screens/details/details_screen.dart';
import 'package:dbara_app/screens/home/home_screen.dart';
import 'package:dbara_app/screens/otp/otp_screen.dart';
import 'package:dbara_app/screens/profile/profile_screen.dart';
import 'package:dbara_app/screens/side_menu/cart_screen.dart';
import 'package:dbara_app/screens/sign_up/sign_up.dart';
import 'package:dbara_app/screens/splash/splash_screen.dart';
import 'package:flutter/widgets.dart';

Recipe recipe = Recipe as Recipe;

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(recipe: recipe),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
};
