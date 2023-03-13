import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dbaramobile/info_card.dart';
import 'package:dbaramobile/side_menu_tile.dart';
import 'package:dbaramobile/menu.dart';


class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: Colors.orange,
        child: Column(
          children: [
            const InfoCard(),
            Padding(
              padding: const EdgeInsets.only(
                left: 24,
                top: 32,
                bottom: 16
              ),
              child: Text("Parcourir".toUpperCase(),
                style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  !.copyWith(color: Colors.white70),
              ),
            ),
            ...sidebarMenus.map(
                    (menu) => SideMenuTile(
                      menu: menu,
                      riveonInit: (artboard) {},
                      press: () {},
                      isActive: false,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

