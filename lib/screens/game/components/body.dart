import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../constants.dart';
import '../../../models/data.dart';
import '../../home/components/shared.dart';

class Body extends StatefulWidget {

  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  void toggleFavorite(Recipe recipe) {
    setState(() {
      recipe.isFavorite = !recipe.isFavorite;
      if (recipe.isFavorite) {
        recipe.likes += 1;
        // Ajouter l'article à la liste des favoris s'il n'est pas déjà présent
        if (!favorites.contains(recipe)) {
          favorites.add(recipe);
        }
      } else {
        recipe.likes -= 1;
        // Supprimer l'article de la liste des favoris s'il est présent
        favorites.remove(recipe);
        // Mettre à jour l'état de l'article dans la liste des articles de la page d'accueil
        Recipe homeArticle = recipes.firstWhere((element) => element.title == recipe.title);
        homeArticle.isFavorite = false;
      }
    });
  }

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
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      buildTextTitleVariation1('A7la Tawla'),
                      buildTextSubTitleVariation1(
                        'Votre table ramadanesque dima meziana, prenez la en photo et participez au jeu ou votez. des gros lots vous attendent !',
                      ),
                      const SizedBox(height: 16),
                      Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/bg-header.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: CarouselSlider(
                          items: imageList.map((imagePath) {
                            return Image.asset(
                              imagePath,
                              fit: BoxFit.cover,
                            );
                          }).toList(),
                          options: CarouselOptions(
                            height: 200, // hauteur du carrousel
                            autoPlay: true, // lecture automatique des images
                            enlargeCenterPage:
                                true, // agrandir l'image centrale
                            aspectRatio: 16 / 9, // ratio d'aspect des images
                            autoPlayCurve: Curves
                                .fastOutSlowIn, // courbe de transition automatique
                            enableInfiniteScroll: true, // défilement infini
                            autoPlayInterval: const Duration(
                                seconds: 3), // intervalle entre les images
                            autoPlayAnimationDuration: const Duration(
                                milliseconds: 800), // durée de l'animation
                            viewportFraction:
                                0.8, // fraction de l'écran occupée par l'image
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.black.withOpacity(0.1),
                              width: 1.9,
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildTextSubTitleVariation1(
                                'Apprenez à cuisiner tout en gagnant de beaux cadeaux. \nc’est seulement chez Dbara, restez connecté(e)s ',
                              ),
                            ],
                          ),

                        ),
                      ),
                      const SizedBox(height: 16), // Espace entre le texte et le bouton
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            // Action à effectuer lors du clic sur le bouton
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.orange, // Couleur orange
                            onPrimary: Colors.white, // Couleur du texte (blanc ici)
                            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16), // Taille du bouton
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10), // Bordure arrondie
                            ),
                          ),
                          child: const Text(
                            'Participer',
                            style: TextStyle(
                              fontSize: 18, // Taille du texte
                            ),
                        ),
                      ),
                      ),
                      Stack(
                        children: [
                          //SvgPicture.asset(
                            //'assets/images/bg_content.svg',
                            //fit: BoxFit.cover,
                         // ),
                          SizedBox(
                            height: 500,
                            child: Column(
                              children: [
                                // Ajoutez ici le contenu du conteneur
                            Expanded(
                              child: ListView.builder(
                              itemCount: jeux.length,
                                itemBuilder: (context, index) {
                                  Jeu jeu = jeux[index];
                                  return Container(
                                    margin: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(20),
                                      ),
                                      boxShadow: [kBoxShadow],
                                    ), //bordure de l'article
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 160,
                                          width: 160,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(jeu.imagePath),
                                              fit: BoxFit.fitHeight,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 16),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  jeu.nom,
                                                  style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                                Text(
                                                  jeu.description,
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text(
                                                      "${jeu.likes} likes",
                                                      style: const TextStyle(
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                    IconButton(
                                                      icon: Icon(
                                                        jeu.isFavorite ? Icons.favorite : Icons.favorite_border,
                                                        color: jeu.isFavorite ? Colors.red : null,
                                                      ),
                                                      onPressed: () {
                                                        //toggleFavorite(recipe);
                                                      },
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
