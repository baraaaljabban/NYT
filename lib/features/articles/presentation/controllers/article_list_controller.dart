import 'package:flutter/material.dart';
import 'package:nyt_app/core/AppStrings/error_strings.dart';
import 'package:nyt_app/features/articles/domain/entities/article.dart';

class ArticleListController extends StatelessWidget {
  final List<Article> articles;
  ArticleListController({Key? key, required this.articles}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Articles"),
        ),
      ),
      body: articles.length == 0
          ? Text(NO_DATA_FOUND)
          : ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: articles.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  borderOnForeground: true,
                  clipBehavior: Clip.hardEdge,
                  elevation: 5,
                  child: ListTile(
                    leading: Text("${index+1}"),
                    title: Text(articles[index].title),
                    subtitle: Text(articles[index].publishedDate),
                  ),
                );
              },
            ),
    );
  }
}
