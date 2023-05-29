class Recipe {

  String title;
  String description;
  String image;
  int calories;
  int carbo;
  int protein;
  int likes;
  bool isFavorite;

  Recipe(
      this.title,
      this.description,
      this.image,
      this.calories,
      this.carbo,
      this.protein,
      this.likes,
      this.isFavorite
      );

}

List<Recipe> recipes = [
    Recipe("Chicken Fried Rice", "So irresistibly delicious", "assets/images/chicken_fried_rice.png", 250, 35, 6,0,false),
    Recipe("Pasta Bolognese", "True Italian classic with a meaty, chilli sauce", "assets/images/pasta_bolognese.png", 200, 45, 10,0,false),
    Recipe("Garlic Potatoes", "Crispy Garlic Roasted Potatoes", "assets/images/filete_con_papas_cambray.png", 150, 30, 8,0,false),
    Recipe("Asparagus", "White Onion, Fennel, and watercress Salad", "assets/images/asparagus.png", 190, 35, 12,0,false),
    Recipe("Filet Mignon", "Bacon-Wrapped Filet Mignon", "assets/images/steak_bacon.png", 250, 55, 20,0,false),
  ];



List<bool> optionSelected = [true, false, false];

List<Recipe> favoriteRecipes = recipes.where((article) => article.isFavorite).toList();