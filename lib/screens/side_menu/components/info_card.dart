import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InfoCard extends StatelessWidget {
  final String? phoneNumber;

  const InfoCard({Key? key,
    this.phoneNumber}) : super(key: key);

  Future<String?> getStoredPhoneNumber() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getString('phoneNumber');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: getStoredPhoneNumber(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final phoneNumber = snapshot.data!;
          return ListTile(
            leading: const CircleAvatar(
              backgroundColor: Colors.white24,
              child: Icon(
                CupertinoIcons.person,
                color: Colors.white,
              ),
            ),
            title: Text(phoneNumber),
          );
        } else {
          // Afficher un indicateur de chargement ou un widget vide si les données ne sont pas encore disponibles.
          return const CircularProgressIndicator();
        }
      },
    );
  }
}