import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nyt_app/core/AppStrings/error_strings.dart';
import 'package:nyt_app/core/error/failures.dart';
import 'package:nyt_app/features/articles/article_export/articl_export.dart';
import 'package:nyt_app/features/articles/domain/entities/article.dart';

import 'repository_impl_test.mocks.dart';

@GenerateMocks([ArticleRepositoryImpl])
void main() {
  group('getMostPopularArticle', () {
    test('return list of articls whene there is internet connection', () async {
      final repoIpl = MockArticleRepositoryImpl();
      List<Article> articls = [];
      when(repoIpl.getMostPopularArticle(days: 7, type: "emailed"))
          .thenAnswer((_) async => Right(articls));
      expect(
          await repoIpl.getMostPopularArticle(
            days: 7,
            type: "emailed",
          ),
          Right(articls));
      verify(repoIpl.getMostPopularArticle(
        days: 7,
        type: "emailed",
      ));
    });

    test('should throw Exp for no intenret connection', () async {
      final repoIpl = MockArticleRepositoryImpl();
      when(repoIpl.getMostPopularArticle(days: 7, type: "emailed")).thenAnswer(
          (_) async => Left(InternetConnectionFailure(NO_INTERNET)));
      expect(await repoIpl.getMostPopularArticle(type: "emailed", days: 7),
          equals(Left(InternetConnectionFailure(NO_INTERNET))));
      verifyZeroInteractions(
          repoIpl.getMostPopularArticle(type: "emailed", days: 7));
    });
  });
}
