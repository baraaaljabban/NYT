part of 'package:nyt_app/core/Service/injection_service.dart';

void articlDependencyIncection() {
  sl.registerFactory<ArticleRemoteDataSrouce>(
      () => ArticleRemoteDataSrouceImpl(client: sl()));

  sl.registerFactory<ArticleRepository>(
    () => ArticleRepositoryImpl(
      remoteDataSrouce: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerFactory(() => SearchArticleUC(repository: sl()));
  sl.registerFactory(() => MostPopularArticleUC(repository: sl()));

  sl.registerFactory(
    () => ArticlesBloc(
      mostPopularArticleUC: sl(),
      searchArticleUC: sl(),
    ),
  );
}
