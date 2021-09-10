import 'package:dartz/dartz.dart';

import 'package:nyt_app/core/UseCases/use_cases.dart';
import 'package:nyt_app/core/error/failures.dart';
import 'package:nyt_app/features/articles/domain/entities/article.dart';
import 'package:nyt_app/features/articles/domain/repositories/article_repository.dart';

class MostPopularArticleUC
    extends UseCase<List<Article>, MostPopularArticleParams> {
  final ArticleRepository repository;
  MostPopularArticleUC({
    required this.repository,
  });

  @override
  Future<Either<Failure, List<Article>>> call({
    required MostPopularArticleParams params,
  }) async {
    return await repository.getMostPopularArticle(
        type: params.type, days: params.days);
  }
}

class MostPopularArticleParams {
  final int days;
  final String type;
  MostPopularArticleParams({
    required this.days,
    required this.type,
  });
}
