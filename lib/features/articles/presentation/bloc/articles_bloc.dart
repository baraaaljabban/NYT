import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nyt_app/core/AppStrings/error_strings.dart';
import 'package:nyt_app/features/articles/article_export/articl_export.dart';

import 'package:nyt_app/features/articles/domain/entities/article.dart';
import 'package:nyt_app/features/articles/domain/usecases/most_popular.dart';
import 'package:nyt_app/features/articles/domain/usecases/search_uc.dart';

part 'articles_event.dart';
part 'articles_state.dart';

class ArticlesBloc extends Bloc<ArticlesEvent, ArticlesState> {
  final SearchArticleUC searchArticleUC;
  final MostPopularArticleUC mostPopularArticleUC;
  ArticlesBloc({
    required this.searchArticleUC,
    required this.mostPopularArticleUC,
  }) : super(ArticlesInitial());

  @override
  Stream<ArticlesState> mapEventToState(
    ArticlesEvent event,
  ) async* {
    if (event is MostPopularEvent) {
      yield Loading();
      var result = await mostPopularArticleUC.call(params: event.params);
      yield result.fold(
        (l) => Error(message: l.message),
        (r) => ArticleListState(articles: r),
      );
    } else if (event is SearchArticleEvent) {
      if (event.params.query.trim().isEmpty)
        yield Error(message: EMPTY_QUERY);
      else {
        yield Loading();
        var result = await searchArticleUC.call(params: event.params);
        yield result.fold(
          (l) => Error(message: l.message),
          (r) => ArticleListState(articles: r),
        );
      }
    }
  }
}
