import 'package:dbara_app/screens/home/components/search_field.dart';
import 'package:dbara_app/screens/home/components/shared.dart';
import 'package:dbara_app/screens/side_menu/side_screen.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../models/data.dart';
import 'detail.dart';

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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String searchQuery = '';
  bool isFavorite = false;
  bool isSearching = false;

  toggleFavorite(int i, List<Recipe> favoriteRecipes) {
    setState(() {
      recipes[i].likes++;
      isFavorite = !isFavorite;
      Recipe recipe = favoriteRecipes[i];
      if (recipe.isFavorite) {
        favoriteRecipes.remove(recipe);
      } else {
        favoriteRecipes.add(recipe);
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
          brightness: Brightness.light,
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
                        'Healthy and nutritious food recipes'),
                    const SizedBox(
                      height: 32,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        option('Vegetable', 'assets/icons/salad.png', 0),
                        const SizedBox(
                          width: 8,
                        ),
                        option('Rice', 'assets/icons/rice.png', 1),
                        const SizedBox(
                          width: 8,
                        ),
                        option('Fruit', 'assets/icons/fruit.png', 2),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Container(
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
              Container(
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
    return GestureDetector(
      onTap: () {
        setState(() {
          optionSelected[index] = !optionSelected[index];
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
              child: Image.asset(
                image,
                color: optionSelected[index] ? Colors.white : Colors.black,
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
          MaterialPageRoute(builder: (context) => Detail(recipe: recipe)),
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
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed:  () {}  //toggleFavorite(index),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildPopulars() {
    List<Widget> list = [];
    for (var i = 0; i < recipes.length; i++) {
      list.add(buildPopular(recipes[i], i, favoriteRecipes));
    }
    return list;
  }

  Widget buildPopular(Recipe recipe, int i, List<Recipe> favoriteRecipes) {
    bool isFavorite = favoriteRecipes.contains(recipe);
    IconData favoriteIcon = isFavorite ? Icons.favorite : Icons.favorite_border;
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
                      buildCalories("${recipe.likes} Kcal"),
                      IconButton(
                        icon: Icon(
                          favoriteIcon,
                          color: isFavorite ? Colors.red : null,
                        ),
                        onPressed: () {
                          toggleFavorite(i, favoriteRecipes);
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
