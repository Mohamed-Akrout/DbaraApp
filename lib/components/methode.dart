import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void showShareAlert(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Partager sur :'),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.facebook),
              onPressed: () {
                // Logique de partage sur Facebook
              },
            ),
            IconButton(
              onPressed: () {
                // Logique de partage sur Instagram
              },
              icon: SvgPicture.asset(
                'assets/icons/instagram.svg', // Chemin vers le fichier SVG de l'icône Instagram
                width: 24,
                height: 24,
              ),
            ),
            IconButton(
              onPressed: () {
                // Logique de partage sur Twitter
              },
              icon: SvgPicture.asset(
                'assets/icons/twitter.svg', // Chemin vers le fichier SVG de l'icône Twitter
                width: 24,
                height: 24,
              ),
            ),
          ],
        ),
      );
    },
  );
}

void showCommentAlert(BuildContext context) {
  TextEditingController commentController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Commenter'),
        content: TextField(
          controller: commentController,
          decoration: InputDecoration(
            hintText: 'Saisissez votre commentaire',
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              // Récupérer le commentaire et l'envoyer
              String comment = commentController.text;
              // Faire quelque chose avec le commentaire (envoi, affichage, etc.)

              Navigator.pop(context); // Fermer la boîte de dialogue
            },
            child: Text('Envoyer'),
          ),
        ],
      );
    },
  );
}

void showUploadPhotoDialog(BuildContext context) {
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Télécharger une photo'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Voulez-vous télécharger une photo ?'),
            SizedBox(height: 16),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Nom',
              ),
            ),
            SizedBox(height: 8),
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(
                labelText: 'Prénom',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Logique pour joindre une image avec les noms et prénoms
              String name = nameController.text;
              String lastName = lastNameController.text;
              // Faites quelque chose avec les noms et prénoms...
              Navigator.pop(context); // Fermer l'alerte
            },
            child: Text('Joindre une image'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Fermer l'alerte
            },
            child: Text('Annuler'),
          ),
        ],
      );
    },
  );
}