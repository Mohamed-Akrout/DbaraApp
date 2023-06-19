import 'package:rive/rive.dart';
import '../../../models/rive_model.dart';

class Menu {
  final String title;
  late SMIBool? input;
  final RiveModel rive;
  final String route;

  Menu({
    this.input,
    required this.title,
    required this.rive,
    required this.route,
  });

  set setInput(SMIBool status){
    input = status;
  }
}

List<Menu> sidebarMenus = [
  Menu(
    title: "Home",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "HOME",
        stateMachineName: "HOME_interactivity"),
    route: "/home",
  ),
  Menu(
    title: "Search",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "SEARCH",
        stateMachineName: "SEARCH_Interactivity"),
    route: '',
  ),
  Menu(
    title: "Favorites",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "LIKE/STAR",
        stateMachineName: "STAR_Interactivity"),
    route: "/favourite",
  ),
  Menu(
    title: "Jeux",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "CHAT",
        stateMachineName: "CHAT_Interactivity"),
    route: "/game",
  ),
];

List<Menu> sidebarMenus2 = [
  Menu(
    title: "Dbara LIVE",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "TIMER",
        stateMachineName: "TIMER_Interactivity"),
    route: '',
  ),
  Menu(
    title: "Dbara Reel",
    rive: RiveModel(
        src: "assets/RiveAssets/icons.riv",
        artboard: "BELL",
        stateMachineName: "BELL_Interactivity"),
    route: '',
  ),
  Menu(
      title: "Chef",
      rive: RiveModel(
      src: "assets/RiveAssets/icons.riv",
      artboard: 'USER',
      stateMachineName: 'USER_Interactivity',
  ),
    route: "/chef",
  ),
];
