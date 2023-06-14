import 'package:flutter/material.dart';

import '../../home/components/shared.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
    child: Column(
    children: [
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    buildTextTitleVariation1('Dbara'),
    buildTextSubTitleVariation1(
    'Des recettes et astuces magiques qui vous changent la vie'),
    const SizedBox(
    height: 32,
    ),
        ],
    ),
    ),
    ],
    ),
        ),
    );
  }
}
