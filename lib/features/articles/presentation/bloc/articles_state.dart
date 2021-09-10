part of 'articles_bloc.dart';

@immutable
abstract class ArticlesState {}

class ArticlesInitial extends ArticlesState {}

class Loading extends ArticlesInitial {}

class Error extends ArticlesInitial {
  final String message;
  Error({required this.message});
}

class ArticleListState extends ArticlesInitial {
  final List<Article> articles;
  ArticleListState({
    required this.articles,
  });
}
