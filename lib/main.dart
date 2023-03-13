import 'package:dbaramobile/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dbaramobile/verify.dart';
import 'package:dbaramobile/phone.dart';
import 'package:dbaramobile/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: 'sideMenu',
    debugShowCheckedModeBanner: false,
    routes: {
      'sideMenu': (context) => SideMenu(),
      'phone': (context) => MyPhone(),
      'verify': (context) => MyVerify(),
      'home': (context) => MyHome()
    },
  ));
}
