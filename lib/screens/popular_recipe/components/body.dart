import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../models/data.dart';

class PopularArticlesPage extends StatefulWidget {

  late final Recipe recipe;
  @override
  _PopularArticlesPageState createState() => _PopularArticlesPageState();
}

class _PopularArticlesPageState extends State<PopularArticlesPage> {



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
    favorites.sort((a, b) => b.likes.compareTo(a.likes)); // Tri en ordre descendant par le nombre de likes
    return Scaffold(
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          Recipe recipe = favorites[index];
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
                      image: AssetImage(recipe.image),
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
                          recipe.title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          recipe.description,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${recipe.likes} likes",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                recipe.isFavorite ? Icons.favorite : Icons.favorite_border,
                                color: recipe.isFavorite ? Colors.red : null,
                              ),
                              onPressed: () {
                                toggleFavorite(recipe);
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
    );
  }
}
