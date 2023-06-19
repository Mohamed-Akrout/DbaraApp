import 'package:dbara_app/screens/categories/categories_screen.dart';
import 'package:dbara_app/screens/home/components/search_field.dart';
import 'package:dbara_app/screens/home/components/shared.dart';
import 'package:dbara_app/screens/side_menu/side_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../../../constants.dart';
import '../../../models/data.dart';
import 'detail.dart';
import 'package:http/http.dart' as http;

class Body extends StatefulWidget {
  const Body({
    super.key,
    required this.recipe,
  });

  final Recipe? recipe;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  //late Future<Recipe> futureAlbum;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String searchQuery = '';
  bool isFavorite = false;
  bool isSearching = false;

  void toggleFavorite(Recipe recipe) {
    setState(() {
      recipe.isFavorite = !recipe.isFavorite;
      if (recipe.isFavorite) {
        recipe.likes++;
        // Ajouter l'article à la liste des favoris si ce n'est pas déjà fait
        if (!favorites.contains(recipe)) {
          favorites.add(recipe);
        }
      } else {
        recipe.likes--;
        // Retirer l'article de la liste des favoris s'il existe
        favorites.remove(recipe);
      }
    });
  }

  void toggleSearch() {
    setState(() {
      isSearching = !isSearching;
    });
  }

  void hideSearch() {
    setState(() {
      isSearching = false;
    });
  }



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: hideSearch,
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        key: _scaffoldKey,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: GestureDetector(
            onTap: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            child: const Icon(Icons.menu_rounded, color: Colors.black),
          ),
          actions: [
            if (isSearching)
              SearchField(
                onChanged: (value) {
                  setState(() {
                    searchQuery = value;
                  });
                },
              )
            else
              GestureDetector(
                onTap: toggleSearch,
                child: const Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Icon(Icons.search_rounded, color: Colors.black),
                ),
              ),
          ],
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        drawer: const SideScreen(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTextTitleVariation1('Dbara'),
                    buildTextSubTitleVariation1(
                        'Des recettes et astuces magiques qui vous changent la vie'),
                    const SizedBox(
                      height: 32,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          option('Dbara Zemneya',
                              'assets/icons/lol/ic_zemnia.svg', 0),
                          const SizedBox(
                            width: 8,
                          ),
                          option('Dbara 3la Ghafla',
                              'assets/icons/lol/ic_ghafla.svg', 1),
                          const SizedBox(
                            width: 8,
                          ),
                          option('Dbara Hlowa', 'assets/icons/lol/ic_hlowa.svg',
                              2),
                          const SizedBox(
                            width: 8,
                          ),
                          option('Dbara 7afféli',
                              'assets/icons/lol/ic_haffeli.svg', 3),
                          const SizedBox(
                            width: 8,
                          ),
                          option('Dbara El Préférée',
                              'assets/icons/lol/ic_favoris.svg', 4),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              //SizedBox(
                //height: 350,
                //child: FutureBuilder<List<Widget>>(
                  //future: buildRecipes(),
                  //builder: (BuildContext context,
                    //  AsyncSnapshot<List<Widget>> snapshot) {
                    //if (snapshot.connectionState == ConnectionState.waiting) {
                      // Afficher un indicateur de chargement pendant que les recettes sont récupérées
                      //return CircularProgressIndicator();
                    //} else if (snapshot.hasError) {
                      // Gérer les erreurs ici
                      //return Text(
                        //  'Erreur de récupération des recettes : ${snapshot.error}');
                    //} else {
                      // La récupération des recettes est terminée, vous pouvez utiliser la liste de widgets
                      //return ListView(
                        //physics: const BouncingScrollPhysics(),
                        //scrollDirection: Axis.horizontal,
                        //children: snapshot.data ?? [],
                      //);
                    //}
                  //},
                //),
              //),
              SizedBox(
                height: 350,
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: buildRecipes(),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    buildTextTitleVariation2('Popular', false),
                    const SizedBox(
                      width: 8,
                    ),
                    buildTextTitleVariation2('Food', true),
                  ],
                ),
              ),
              SizedBox(
                height: 190,
                child: PageView(
                  physics: const BouncingScrollPhysics(),
                  children: buildPopulars(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget option(String text, String image, int index) {
    // Vérifiez si l'index est supérieur ou égal à la taille de la liste optionSelected
    if (index >= optionSelected.length) {
      // Ajoutez des valeurs booléennes supplémentaires à la liste pour atteindre l'index spécifié
      for (int i = optionSelected.length; i <= index; i++) {
        optionSelected.add(false);
      }
    }
    return GestureDetector(
      onTap: () {
        setState(() {
          optionSelected[index] = !optionSelected[index];
          // Naviguer vers la page spécifique avec les données appropriées
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CategoriesScreen(),
            ),
          );
        });
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: optionSelected[index] ? kPrimaryColor : Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [kBoxShadow],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Row(
          children: [
            SizedBox(
              height: 32,
              width: 32,
              child: SvgPicture.asset(
                image,
                colorFilter: ColorFilter.mode(
                  optionSelected[index] ? Colors.white : Colors.black,
                  BlendMode.srcIn,
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              text,
              style: TextStyle(
                color: optionSelected[index] ? Colors.white : Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Future<List<Widget>> buildRecipes() async {
   // List<Widget> list = [];

    //try {
      //var recipes = await fetchDbaraRecettes();
      //for (var i = 0; i < recipes.length; i++) {
        //list.add(buildRecipe(recipes[i], i));
      //}
    //} catch (error) {
      // Gérez les erreurs ici
      //print('Erreur de récupération des recettes : $error');
    //}
    //return list;
  //}

  List<Widget> buildRecipes() {
    List<Widget> list = [];
    for (var i = 0; i < recipes.length; i++) {
      list.add(buildRecipe(recipes[i], i));
    }
    return list;
  }

  Widget buildRecipe(Recipe recipe, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Detail(recipe: recipe),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: [kBoxShadow],
        ),
        margin: EdgeInsets.only(
            right: 16, left: index == 0 ? 16 : 0, bottom: 16, top: 8),
        padding: const EdgeInsets.all(16),
        width: 220,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Hero(
                tag: recipe.image,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(recipe.image),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            buildRecipeTitle(recipe.title),
            buildTextSubTitleVariation2(recipe.description),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildCalories("${recipe.likes} Likes"),
                IconButton(
                    icon: Icon(
                      recipe.isFavorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: recipe.isFavorite ? Colors.red : null,
                    ),
                    onPressed: () {
                      toggleFavorite(recipe);
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildPopulars() {
    return favorites
        .where((recipe) => recipe.isFavorite)
        .map((recipe) => buildPopular(recipe))
        .toList();
  }

  Widget buildPopular(Recipe recipe) {
    IconData favoriteIcon =
        recipe.isFavorite ? Icons.favorite : Icons.favorite_border;
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        boxShadow: [kBoxShadow],
      ),
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
                  buildRecipeTitle(recipe.title),
                  buildRecipeSubTitle(recipe.description),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildCalories("${recipe.likes} Likes"),
                      IconButton(
                        icon: Icon(
                          favoriteIcon,
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
  }
}
