import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:nyt_app/features/articles/article_export/articl_export.dart';
import 'package:nyt_app/features/articles/domain/entities/article.dart';

import 'search_artilc_test.mocks.dart';

@GenerateMocks([SearchArticleUC])
void main() {
  test('test useCase of Searching Articles that will return list of artilcs',
      () async {
    final usecase = MockSearchArticleUC();
    List<Article> articls = [
      Article(publishedDate: "publishedDate1", title: "title"),
      Article(publishedDate: "publishedDate2", title: "title2"),
    ];
    final params = SearchArticleParams(query: "Sand");

    when(usecase.call(params: params)).thenAnswer((_) async => Right(articls));
    expect(
      await usecase.call(params: params),
      Right(articls),
    );

    verify(usecase.call(params: params));
  });
}
