import 'dart:convert';

import 'package:nyt_app/features/articles/domain/entities/article.dart';

class ArticleMostPopularResponse {
  List<ArticleModel> results;
  ArticleMostPopularResponse({
    required this.results,
  });

  Map<String, dynamic> toMap() {
    return {
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  factory ArticleMostPopularResponse.fromMap(Map<String, dynamic> map) {
    return ArticleMostPopularResponse(
      results: List<ArticleModel>.from(
          map['results'].map((x) => ArticleModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ArticleMostPopularResponse.fromJson(String source) =>
      ArticleMostPopularResponse.fromMap(json.decode(source));
}

class ArticleModel extends Article {
  String publishedDate;
  String title;

  ArticleModel({
    required this.publishedDate,
    required this.title,
  }) : super(
          title: title,
          publishedDate: publishedDate,
        );

  Map<String, dynamic> toMap() {
    return {
      'publishedDate': publishedDate,
      'title': title,
    };
  }

  factory ArticleModel.fromMap(Map<String, dynamic> map) {
    return ArticleModel(
      publishedDate:
          map['published_date'] != null ? map['published_date'] as String : "",
      title: map['title'] != null ? map['title'] as String : "",
    );
  }

  String toJson() => json.encode(toMap());

  factory ArticleModel.fromJson(String source) =>
      ArticleModel.fromMap(json.decode(source));
}
