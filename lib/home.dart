import 'package:dbaramobile/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:dbaramobile/constants.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Body(),
    );
  }

      AppBar buildAppBar(){
        return AppBar(
        title: Text("Home"),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset("assets/icons/menu.svg"),
          onPressed: (){},
        ),
        actions: <Widget>[
          IconButton(
              icon: SvgPicture.asset("assets/icons/search.svg",
              color: kTextColor, //color par defaut
              ),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset("assets/icons/utilisateur.svg",
              color: kTextColor, //color par defaut
            ),
            onPressed: () {},
          ),
          SizedBox(width: kDefaultPaddin / 2,)
        ],
      );
  }
}

