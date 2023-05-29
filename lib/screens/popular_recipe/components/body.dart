import 'package:flutter/material.dart';

class PopularArticlesPage extends StatefulWidget {
  @override
  _PopularArticlesPageState createState() => _PopularArticlesPageState();
}

class _PopularArticlesPageState extends State<PopularArticlesPage> {
  List<Article> _articles = [
    Article(title: 'Article 1', likes: 10),
    Article(title: 'Article 2', likes: 5),
    Article(title: 'Article 3', likes: 15),
    Article(title: 'Article 4', likes: 8),  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _articles.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              title: Text(_articles[index].title),
              subtitle: Text('${_articles[index].likes} j\'aimes'),
              trailing: IconButton(
                icon: const Icon(Icons.thumb_up),
                onPressed: () {
                  setState(() {
                    _articles[index].likes++;
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

class Article {
  String title;
  int likes;

  Article({required this.title, required this.likes});
}