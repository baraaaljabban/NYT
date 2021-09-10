part of 'articles_bloc.dart';

@immutable
abstract class ArticlesEvent {}

class SearchArticleEvent extends ArticlesEvent {
  final SearchArticleParams params;
  SearchArticleEvent({
    required this.params,
  });
}

class MostPopularEvent extends ArticlesEvent {
  final MostPopularArticleParams params;
  MostPopularEvent({required this.params});
}
