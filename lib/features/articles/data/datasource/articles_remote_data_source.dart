import 'dart:convert';

import 'package:nyt_app/core/Network/http_client.dart';
import 'package:nyt_app/core/Network/response.dart';
import 'package:nyt_app/core/error/exceptions.dart';
import 'package:nyt_app/features/articles/data/Model/article_most_popular_response.dart';
import 'package:nyt_app/features/articles/data/Model/article_search_respose.dart';

abstract class ArticleRemoteDataSrouce {
  Future<ArticleMostPopularResponse> getMostPopularArticle({
    required String type,
    required int days,
  });
  Future<ArticleSearchResponse> searchArticle({
    required String query,
  });
}

class ArticleRemoteDataSrouceImpl extends ArticleRemoteDataSrouce {
  final HttpHelper client;
  ArticleRemoteDataSrouceImpl({
    required this.client,
  });

  @override
  Future<ArticleMostPopularResponse> getMostPopularArticle(
      {required String type, required int days}) async {
    String path = "/mostpopular/v2/$type/$days.json?";

    try {
      final respone = await client.get(path: path);
      final ArticleMostPopularResponse response =
          ArticleMostPopularResponse.fromJson(
        utf8.decode(respone.bodyBytes),
      );
      if (respone.statusCode == RESPONSE_SUCCESS) {
        return response;
      } else {
        throw ServerException(message: respone.reasonPhrase);
      }
    } on ServerException catch (e) {
      throw ServerException(message: e.message.toString());
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<ArticleSearchResponse> searchArticle({required String query}) async {
    String path = "/search/v2/articlesearch.json?q=$query&";

    try {
      final respone = await client.get(path: path);
      final ArticleSearchResponse response = ArticleSearchResponse.fromJson(
        utf8.decode(respone.bodyBytes),
      );
      if (respone.statusCode == RESPONSE_SUCCESS) {
        return response;
      } else {
        throw ServerException(message: respone.reasonPhrase);
      }
    } on ServerException catch (e) {
      throw ServerException(message: e.message.toString());
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }
}
