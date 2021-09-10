import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nyt_app/features/articles/domain/entities/article.dart';
import 'package:nyt_app/features/articles/domain/usecases/most_popular.dart';
import 'package:nyt_app/features/articles/domain/usecases/search_uc.dart';
import 'package:nyt_app/features/articles/presentation/bloc/articles_bloc.dart';
import 'package:nyt_app/features/articles/presentation/controllers/article_list_controller.dart';
import 'package:nyt_app/features/articles/presentation/controllers/search_controller.dart';

class ArticlePageNavigation {
  void moveToArticleListController(
      {required BuildContext context, required List<Article> articles}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ArticleListController(
          articles: articles,
        ),
      ),
    );
  }

  void getTheMostPopular(String type, BuildContext context) {
    BlocProvider.of<ArticlesBloc>(context).add(
      MostPopularEvent(
        params: MostPopularArticleParams(
          days: 7,
          type: type,
        ),
      ),
    );
  }

  void goToSearchController(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchController(),
      ),
    );
  }

  void searchForAnArticle(String query, BuildContext context) {
    BlocProvider.of<ArticlesBloc>(context).add(
      SearchArticleEvent(
        params: SearchArticleParams(
          query: query,
        ),
      ),
    );
  }
}
