import 'package:dbara_app/screens/home/components/shared.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../constants.dart';
import '../../../models/data.dart';
import 'package:url_launcher/url_launcher.dart';

class Detail extends StatelessWidget {
  final Recipe recipe;

  const Detail({
    super.key,
    required this.recipe,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Icon(
              recipe.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: recipe.isFavorite ? Colors.red : null,
            ),
          ),
        ],
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTextTitleVariation1(recipe.title),
                  buildTextSubTitleVariation1(recipe.description),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 400,
              padding: const EdgeInsets.only(left: 16),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildTextTitleVariation2('Nutritions', false),
                      const SizedBox(
                        height: 16,
                      ),
                      buildNutrition(recipe.Difficult, "Difficulté", "Niveau"),
                      const SizedBox(
                        height: 16,
                      ),
                      buildNutrition(recipe.carbo, "Temps", "Min"),
                      const SizedBox(
                        height: 16,
                      ),
                      buildNutrition(recipe.protein, "Ingrédients", "Nombre"),
                      const SizedBox(
                        height: 16,
                      ),
                      buildNutrition(recipe.likes, "J'aimes", "Nombre"),
                    ],
                  ),
                  Positioned(
                    right: -80,
                    child: Hero(
                      tag: recipe.image,
                      child: Container(
                        height: 310,
                        width: 310,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(recipe.image),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 80),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildTextTitleVariation2('Apports Nutritifs', false),
                  buildTextSubTitleVariation1(
                      "Caractéristiques du poulet : \n- Excellente source de protéines maigres  \n- Peu calorique  \n- Profil lipidique intéressant  \n- Favorise la santé cardiovasculaire  \n- Richesse en vitamines et minéraux"),
                  const SizedBox(
                    height: 16,
                  ),
                  buildTextTitleVariation2('Ingredients', false),
                  buildTextSubTitleVariation1("Poulet"),
                  buildTextSubTitleVariation1("Tomate concentrée"),
                  buildTextSubTitleVariation1("Harissa"),
                  buildTextSubTitleVariation1(
                      "Epices : sel poivre tebel curcuma, cannelle"),
                  buildTextSubTitleVariation1("Huile d’olive"),
                  buildTextSubTitleVariation1("500 gr Nwasser"),
                  const SizedBox(
                    height: 16,
                  ),
                  buildTextTitleVariation2('Recipe preparation', false),
                  buildTextSubTitleVariation1("STEP 1"),
                  buildTextSubTitleVariation1(
                      "Dans une marmite faire chauffer l’huile et ajouter les oignons découpés finement faire cuire quelques minutes et ajouter le poulet découpé, ajouter la tomate concentrée, harissa et les épices cuire quelques minutes et ajouter l'eau et cuire 30 minutes."),
                  buildTextSubTitleVariation1("STEP 2"),
                  buildTextSubTitleVariation1(
                      "Entre temps préparer la Nwasser avec de l’huile, la verser dans le couscoussier et laisser cuire à la vapeur jusqu'à la cuisson de la sauce."),
                  buildTextSubTitleVariation1("STEP 3"),
                  buildTextSubTitleVariation1(
                      "Pour la sauce vous pouvez mettre des légumes : pomme de terre, carottes et poivrons selon votre choix."),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: ()  {
          // Ouvrir la vidéo en utilisant l'URL ou l'application vidéo externe
          const videoUrl = 'https://www.youtube.com/watch?v=-8T34CfNo9s&ab_channel=Dbarabyorange';
           launch(videoUrl);
        },
        backgroundColor: kPrimaryColor,
        icon: const Icon(
          Icons.play_circle_fill,
          color: Colors.white,
          size: 32,
        ),
        label: const Text(
          "Watch Video",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget buildNutrition(dynamic value, String title, String subTitle) {
    String displayValue = value != null ? value.toString() : 'N/A';
    return Container(
      height: 60,
      width: 170,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: const BorderRadius.all(
          Radius.circular(50),
        ),
        boxShadow: [kBoxShadow],
      ),
      child: Row(
        children: [
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [kBoxShadow],
            ),
            child: Center(
              child: Text(
                value.toString(),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subTitle,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[400],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
