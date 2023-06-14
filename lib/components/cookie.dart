import 'package:dbara_app/screens/game/components/body.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class CookieBanner extends StatefulWidget {
  final bool showBanner;
   final ValueSetter<bool?> onAccept;
   final VoidCallback onClose;

  const CookieBanner({super.key,
     required this.showBanner,
    required this.onAccept,
    required this.onClose
  });

  @override
  State<CookieBanner> createState() => _CookieBannerState();
}

class _CookieBannerState extends State<CookieBanner> {
  bool _accepted = false;
  bool _showAcceptButton = false;
  bool _isBannerClosed = true;

  void closeBanner() {
    setState(() {
      _isBannerClosed = false;
    });
    widget.onClose();
  }

  void _handleAccept() {
    setState(() {
      _accepted = true;
      _showAcceptButton = false;
      _isBannerClosed = true;
    });
    widget.onAccept(true);
  }

  @override
  Widget build(BuildContext context) {

    return widget.showBanner
        ? SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: closeBanner,
                  ),
                ],
              ),
              Image.asset('assets/images/photo_cookie.png'), // Remplacez le chemin d'accès par votre propre image
              const Text(
                "Bienvenue à l'espace Jeux Dbara\n"
                    "Pleins de jeux, promotions et surprises vous attendent, restez connecté(e)s",
                textAlign: TextAlign.center,
              ),
              Row(
                children: [
                  Theme(
                    data: ThemeData(
                      unselectedWidgetColor: Colors.grey,
                      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kPrimaryColor), // Couleur du checkbox cochée
                    ),
                    child: Checkbox(
                      value: _accepted,
                      onChanged: (value) {
                        setState(() {
                          _accepted = value ?? false;
                          _showAcceptButton = value ?? false;
                        });
                        widget.onAccept(value);
                      },
                    ),
                  ),
                  const Text("J'ai lu et j'accepte les Conditions du Jeu Concours"),
                ],
              ),
              if(_showAcceptButton)
              ElevatedButton(
                onPressed: _handleAccept,
                child: const Text('Accepter'),
              ),
            ],
          ),
        )
        : const SizedBox.shrink();

  }

}