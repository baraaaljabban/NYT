import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:nyt_app/core/error/exceptions.dart';
import 'package:nyt_app/features/articles/article_export/articl_export.dart';
import 'package:nyt_app/features/articles/data/Model/article_search_respose.dart';

import 'remote_data_srouce_test.mocks.dart';


// class MockArticleRemoteDataSrouce extends Mock
//     implements ArticleRemoteDataSrouce {}

void main() {
  group('Article Remote Data source', () {
    test(
        'test Remote Data Source Searching Articles that will  return ArticleSearchResponse',
        () async {
      final mockRepo = MockArticleRemoteDataSrouce();
      var response = ArticleSearchResponse(
          copyright: "", response: Response(docs: []), status: "");

      when(mockRepo.searchArticle(query: "Sand"))
          .thenAnswer((_) async => response);
      expect(
        await mockRepo.searchArticle(query: "Sand"),
        response,
      );

      verify(mockRepo.searchArticle(query: "Sand"));
    });

    test('Remote Data Source Searching Articles will throw Exp', () async {
      final mockRepo = MockArticleRemoteDataSrouce();
      when(mockRepo.searchArticle(query: "Sand"))
          .thenThrow((_) async => ServerException(message: "message"));
      final result = await mockRepo.searchArticle(query: "Sand");
      verify(mockRepo.searchArticle(query: "Sand"));
      expect(result, (ServerException(message: "message")));
    });
  });
}
