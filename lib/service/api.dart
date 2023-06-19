//import 'package:http/http.dart' as http;
//import 'dart:convert';

//Future<Recipe> fetchData() async {
//var url = Uri.parse('https://votre-backend.com/votre-endpoint');

//var response = await http.get(url);

//if (response.statusCode == 200) {
// La requête a réussi, vous pouvez traiter les données ici
//var data = response.body;
//print(data);
//} else {
// La requête a échoué
// print('Erreur de requête: ${response.statusCode}');
//}
//}

//class Recipe {
//String title;
//String description;
//String image;
//String Difficult;
//int carbo;
//int protein;
//int likes;
//bool isFavorite;
// Add more properties here

//Recipe({
//required this.title,
//required this.description,
//required this.image,
//required this.Difficult,
//required this.carbo,
//required this.protein,
//required this.likes,
//required this.isFavorite,
//});

//factory Recipe.fromJson(Map<String, dynamic> json) {
//return Recipe(
//title: json['title'],
//description: json['description'],
//image: json['image'],
//Difficult: json['Difficult'],
//carbo: json['carbo'],
//protein: json['protein'],
//likes: json['likes'],
//isFavorite: json['isFavorite'],
// Parse more properties from the JSON response
//);
//}
//}

//Future<List<Recipe>> fetchDbaraRecettes() async {
//final response = await http
//  .get(Uri.parse('http://your-symfony-app-url/recette/recetteApi'));

//if (response.statusCode == 200) {
//final jsonList = json.decode(response.body) as List;
//return jsonList.map((json) => Recipe.fromJson(json)).toList();
//} else {
//throw Exception('Failed to fetch DbaraRecettes');
//}
//}