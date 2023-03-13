import 'package:dbaramobile/constants.dart';
import 'package:flutter/material.dart';
import 'package:dbaramobile/categories.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding( padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin),
        child: Text("Menu",
        style: Theme.of(context)
            .textTheme
            .headline5
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
        ),
        Categories(),
        Column(
          children: [
            Container(
              padding: EdgeInsets.all(kDefaultPaddin),
              height: 180,
              width: 160,
              decoration: BoxDecoration(
               // color: products[0].color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Image.asset('assets/images/fondant.jpg'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 4),
              child: Text(
                "Fondant",
              style: TextStyle(color: kTextLightColor),
              ),
            ) //titre
          ],
        )
      ],
    );
  }
}

