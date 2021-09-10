import 'package:dartz/dartz.dart';
import 'package:nyt_app/core/error/failures.dart';
import 'package:nyt_app/features/articles/domain/entities/article.dart';

abstract class ArticleRepository {
  Future<Either<Failure, List<Article>>> getMostPopularArticle({
    required String type,
    required int days,
  });
  Future<Either<Failure, List<Article>>> searchArticle({
    required String query,
  });
}
