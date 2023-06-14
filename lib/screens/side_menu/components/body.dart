import 'package:dbara_app/screens/side_menu/components/rive_utils.dart';
import 'package:dbara_app/screens/side_menu/components/side_menu_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';
import 'info_card.dart';
import 'menu.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Menu selectedMenu = sidebarMenus.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 288,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const InfoCard(),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
              child: Text(
                "Parcourir".toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.black45),
              ),
            ),
            ...sidebarMenus.map(
              (menu) => SideMenuTile(
                menu: menu,
                riveonInit: (artboard) {
                  StateMachineController controller =
                      RiveUtils.getRiveController(artboard,
                          stateMachineName: menu.rive.stateMachineName);
                  menu.input = controller.findSMI("active") as SMIBool;
                },
                press: () {
                  menu.input!.change(true);
                  Future.delayed(const Duration(seconds: 1), () {
                    menu.input!.change(false);
                  });
                  setState(() {
                    selectedMenu = menu;
                  });
                },
                isActive: selectedMenu == menu,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, top: 32, bottom: 16),
              child: Text(
                "Historique".toUpperCase(),
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.black45),
              ),
            ),
            ...sidebarMenus2.map(
              (menu) => SideMenuTile(
                menu: menu,
                riveonInit: (artboard) {
                  StateMachineController controller =
                      RiveUtils.getRiveController(artboard,
                          stateMachineName: menu.rive.stateMachineName);
                  menu.input = controller.findSMI("active") as SMIBool;
                },
                press: () {
                  menu.input!.change(true);
                  Future.delayed(const Duration(seconds: 1), () {
                    menu.input!.change(false);
                  });
                  setState(() {
                    selectedMenu = menu;
                  });
                },
                isActive: selectedMenu == menu,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
