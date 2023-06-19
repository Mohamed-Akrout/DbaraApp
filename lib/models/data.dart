
class Recipe {
  String title;
  String description;
  String image;
  String Difficult;
  int carbo;
  int protein;
  int likes;
  bool isFavorite;

  Recipe(
      this.title,
      this.description,
      this.image,
      this.Difficult,
      this.carbo,
      this.protein,
      this.likes,
      this.isFavorite);
}

class Client {
  String? phoneNumber;
}

List<Recipe> recipes = [

  Recipe("Pasta Bolognese",
      "True Italian classic with a meaty, chilli sauce",
      "assets/images/pasta_bolognese.png",
      "F",
      45,
      10,
      0,
      false),
  Recipe("Garlic Potatoes",
      "Crispy Garlic Roasted Potatoes",
      "assets/images/filete_con_papas_cambray.png",
      "F",
      30,
      8,
      0,
      false),
  Recipe("Asparagus",
      "White Onion, Fennel, and watercress Salad",
      "assets/images/asparagus.png",
      "M",
      35,
      12,
       0,
      false),
  Recipe("Filet Mignon",
      "Bacon-Wrapped Filet Mignon",
      "assets/images/steak_bacon.png",
      "H",
      55,
      20,
      0,
      false),
  Recipe(
      "Riz frit au poulet",
      "C’est l’incontournable recette de pâtes carrées légèrement épicée!",
      "assets/images/chicken_fried_rice.png",
      "M",
      35,
      6,
      0,
      false),
];

List<Map<String, String>> splashData = [
  {
    "text": "Bienvenue à Dbara, Prendre ton plat !",
    "image": "assets/images/chef (1).png"
  },
  {
    "text": "We help people conect with store \naround United State of America",
    "image": "assets/images/chef (1).png"
  },
  {
    "text": "We show the easy way to shop. \nJust stay at home with us",
    "image": "assets/images/splash_3.png"
  },
];

List<String> imageList = [
  'assets/images/1.png',
  'assets/images/2.png',
  'assets/images/3.png',
  'assets/images/4.png',
  'assets/images/5.png',
  'assets/images/6.png',
  'assets/images/7.png',
];

class Jeu {
  String nom;
  String prenom;
  String imagePath;
  String description;
  int likes;
  bool isFavorite;

  Jeu(this.likes, this.isFavorite, this.nom, this.prenom, this.imagePath,
      this.description);
}

List<Jeu> jeux = [
  Jeu(0, false, "Mohamed", "Ben Mohamed", "assets/images/gunawia.jpg", "hhhh"),
  Jeu(0, false, "Zaineb", "Auteur 2", "assets/images/fondant.jpg", "jjjjj"),
  // Ajoutez d'autres articles ici
];

class Chef {
  String nom;
  String image;
  String description;
  String mail;
  int number;

  Chef(this.nom, this.image, this.description, this.mail, this.number);
}

List<Chef> chefs = [
  Chef("Chef Wajdi Laaribi", "assets/images/chef1.jpg", "Plats tunisiens traditionnels", "wajdi@gmail.com", 95875869  ),
  Chef("Chef Rania Fitouri", "assets/images/chef2.jpg", "Pizza", "rania@gmail.com", 95875869  ),
  Chef("Chef Lotfi Ben Mohamed", "assets/images/chef3.gif", "Plats tunisiens traditionnels", "lotfi@gmail.com", 95875869  ),
  Chef("Chef Zaineb Aouini", "assets/images/chef4.jpg", "Fast Food", "zaineb@gmail.com", 95875869  ),
  Chef("Chef Amira Hammami", "assets/images/chef5.jpg", "Patisserie", "amira@gmail.com", 95875869  ),
  // Ajoutez d'autres articles ici
];

List<bool> optionSelected = [];

List<Recipe> favorites = [];
