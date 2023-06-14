import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../components/cookie.dart';
import '../../components/custom_bottom_nav_bar.dart';
import '../../enums.dart';
import 'package:dbara_app/screens/game/components/body.dart';

class GameScreen extends StatefulWidget {
  final VoidCallback onClose;
  static String routeName = "/game";

  const GameScreen({super.key, required this.onClose});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  bool _showCookieBanner = false;
  bool _isBannerClosed = true;
  final double _cookieBannerPosition = 0.0;

  Future<bool> checkCookieAccepted() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getBool('cookieAccepted') ?? false;
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _showCookieBanner = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Body(),
          _buildCookieBanner(), // Affiche le cookie
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(selectedMenu: MenuState.home),
    );
  }

  Widget _buildCookieBanner() {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      bottom: _showCookieBanner ? _cookieBannerPosition : -500.0,
      left: 0,
      right: 0,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        height: _showCookieBanner ? 500.0 : 0.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.3),
              blurRadius: 6.0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: CookieBanner(
          showBanner: !_isBannerClosed, // Assurez-vous que le cookie est affiché tant qu'il n'est pas fermé
          onAccept: (bool? value) {},
          onClose: () {
            setState(() {
              _isBannerClosed =
                  false; // Mettez à jour l'état du cookie pour indiquer qu'il est fermé
            });
            widget.onClose();
          },
        ),
      ),
    );
  }
}
